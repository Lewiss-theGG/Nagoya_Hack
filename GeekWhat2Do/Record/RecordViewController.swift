//
//  RecordViewController.swift
//  GeekWhat2Do
//
//  Created by gkin on 2023/08/01.
//

import UIKit
import Firebase
import FirebaseFirestoreSwift


class RecordViewController: UIViewController {
    
    let displayTableView = UITableView()
    
    
    @Published var request = [Record]()
    

    override func viewDidLoad(){
        super.viewDidLoad()

        
        title = "目標一覧"
        view.baseColor(backgroundColor: .systemBackground, opacity: 1)
        
        
        let globalQ = DispatchQueue.global()
        globalQ.sync {
            
            getData()
        }
        
        setView()
    }
    
    final func getData(){
        
        Database().records.getDocuments(completion: { querySnapshot, error in
            
            if let error = error{
                
                print(error.localizedDescription)
                return
            }
            else{
                
                self.request = querySnapshot!.documents.compactMap { (querySnapshot) -> Record? in
                    
                    return try? querySnapshot.data(as: Record.self)
                }
                
                print(self.request)
                self.displayTableView.reloadData()
            }
        }
    )}
    
    
    func setView(){
        
        view.addSubview(displayTableView)
        displayTableView.delegate = self
        displayTableView.dataSource = self
        displayTableView.separatorStyle = .none
        displayTableView.register(RecordTV_Cell.self, forCellReuseIdentifier: "RecordTV_Cell")
        displayTableView.translatesAutoresizingMaskIntoConstraints = false
        displayTableView.backgroundColor = .clear
        
        
        NSLayoutConstraint.activate([
            
            displayTableView.topAnchor.constraint(equalTo: view.safeTopAnchor),
            displayTableView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            displayTableView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -4),
            displayTableView.bottomAnchor.constraint(equalTo: view.safeBottomAnchor),
        ])
    }
}


extension RecordViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return request.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let content = request[indexPath.row]
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecordTV_Cell", for: indexPath) as! RecordTV_Cell
        cell.setCellView()
        cell.backgroundColor = .clear
        cell.overLayButton.tag = indexPath.row
        cell.overLayButton.addTarget(self, action: #selector(cellSelected), for: .touchUpInside)
        cell.titleLabel.text = "\(content.whatToBe)になりたい"
        
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yy年MM月dd日"
        
        
        let declaredAt: String = formatter.string(from: content.declaredAt)
        cell.topLabel.text = "'\(declaredAt)に宣言!"
        
        
        if content.period_M == 0{
            
            cell.aimLabel.text = "達成目標：\(content.period_Y) 年"
        }
        else if content.period_Y == 0{
            
            cell.aimLabel.text = "達成目標：\(content.period_M) ヶ月"
        }
        else {
            
            cell.aimLabel.text = "達成目標：\(content.period_Y) 年 \(content.period_M) ヶ月"
        }
        
        
        let selectedBackgroundView = UIView(frame: cell.contentView.frame)
        selectedBackgroundView.backgroundColor = .clear
        cell.selectedBackgroundView = selectedBackgroundView
        
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return displayTableView.height / 4.2
    }
    
    
    @objc func cellSelected(_ sender: UIButton){
        
        let vc = DetailRecordView()
        vc.record = request[sender.tag]
        
        
        let nvc = UINavigationController(rootViewController: vc)
        nvc.modalPresentationStyle = .fullScreen
        
        
        self.present(nvc, animated: true)
    }
}
