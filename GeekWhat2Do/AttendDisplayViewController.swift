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
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.title = "特産品一覧"
        
        
        self.setLeft(leftBarTitle: "<")
        self.setView()
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
}


extension AttendDisplayViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return ats.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "attendCell", for: indexPath) as! attendCell
        
        let nilView = UIView()
        nilView.backgroundColor = .clear
        cell.backgroundView = nilView
        cell.selectedBackgroundView = nilView
        cell.backgroundColor = .clear
        cell.cellSetView()
        
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yy年MM月dd日"
        cell.dateLabel.text = "\(formatter.string(from: Date()))"
        cell.atLabel.text = "\(ats[indexPath.row])"
        cell.rewardLabel.text = "\(5*(indexPath.row%3 + 1)) TMI　獲得"
        cell.titleLabel.text = "\(ats[indexPath.row]) GOMI 祭り"
        
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
        
        vc.title = "\(ats[indexPath.row]) GOMI 祭り"
        vc.titleValue = "\(ats[indexPath.row]) GOMI 祭り"
        vc.rewardValue = "\(5*(indexPath.row%3 + 1)) TMI　獲得"
        vc.atValue = "\(ats[indexPath.row])"
    }
}
