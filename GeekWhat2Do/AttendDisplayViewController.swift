//
//  AttendDisplayViewController.swift
//  GeekWhat2Do
//
//  Created by gkin on 2023/08/14.
//

import UIKit

class AttendDisplayViewController: UIViewController {
    
    let baseview = GradationView()
    
    
    let displayTable = UITableView()
    
    
    let ats = ["名古屋市",
               "安城市",
               "刈谷市",
               "生駒市",
               "湖西市",
               "浜松市",
               "奈良市",
               "岡崎市",
               "新城市",
               "岐阜市",
               "下呂市",
               "関市",
               "名古屋市",
               "安城市",
               "刈谷市",
               "生駒市",
               "湖西市",
               "浜松市",
               "奈良市",
               "岡崎市",
               "新城市",
               "岐阜市",
               "下呂市",
               "関市",]
    
    
    @Published var attendance = [uAttendance]()
    
    
    @Published var product: uProduct = uProduct(id: String(),
                                                productFrom: String(),
                                                productID: String(),
                                                productImageURL: String(),
                                                productName: String(),
                                                productRequestState: String(),
                                                productRequested: Int(),
                                                productRequestedAt: Date(),
                                                productUnitPrice: Int())
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.title = "イベント一覧"
        
        
        self.setLeft(leftBarTitle: "<")
        self.setView()
        
        let globalQ = DispatchQueue.global()
        globalQ.sync {
            
            self.getAttendance()
        }
    }
    
    
    public func setView(){
        
        view.addSubview(baseview)
        baseview.frame = view.bounds
        baseview.backgroundColor = .systemBackground
        
        
        view.addSubview(displayTable)
        displayTable.delegate = self
        displayTable.dataSource = self
        displayTable.register(attendCell.self, forCellReuseIdentifier: "attendCell")
        displayTable.separatorStyle = .none
        displayTable.backgroundColor = .clear
        displayTable.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            
            displayTable.topAnchor.constraint(equalTo: view.safeTopAnchor),
            displayTable.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            displayTable.bottomAnchor.constraint(equalTo: view.safeBottomAnchor),
            displayTable.widthAnchor.constraint(equalTo: view.widthAnchor),
        ])
    }
    
    
    final func getAttendance(){

        Database().uAttendance.getDocuments(completion: { querySnapshot, error in

            if let error = error{

                print(error.localizedDescription)
                return
            }
            else{
                
                self.attendance = querySnapshot!.documents.compactMap { (querySnapshot) -> uAttendance? in

                    return try? querySnapshot.data(as: uAttendance.self)
                }

                self.displayTable.reloadData()
            }
        }
    )}
}


extension AttendDisplayViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return attendance.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "attendCell", for: indexPath) as! attendCell
        
        let nilView = UIView()
        nilView.backgroundColor = .clear
        cell.backgroundView = nilView
        cell.selectedBackgroundView = nilView
        cell.backgroundColor = .clear
        cell.cellSetView()
        
        
        let data = attendance[indexPath.row]
        
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yy年MM月dd日"
        cell.dateLabel.text = "\(formatter.string(from: data.eventDate))"
        cell.atLabel.text = "\(data.eventAt)"
        cell.rewardLabel.text = "\(data.eventReward) TMI　獲得"
        cell.titleLabel.text = "\(data.eventName)"
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 150
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        let vc = AttendDetailViewController()
        let nvc = UINavigationController(rootViewController: vc)
        nvc.modalPresentationStyle = .fullScreen
        present(nvc, animated: false)
    }
}




import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView = WKWebView(frame: view.bounds)
        webView.navigationDelegate = self
        view.addSubview(webView)
        
        // Load MetaMask extension URL
        if let extensionURL = URL(string: "chrome-extension://<extension_id>/popup.html") {
            let request = URLRequest(url: extensionURL)
            webView.load(request)
        }
    }
}


