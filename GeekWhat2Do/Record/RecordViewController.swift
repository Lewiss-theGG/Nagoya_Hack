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
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
        view.baseColor(backgroundColor: .systemBackground, opacity: 1)
        
        
        setView()
        setLeft()
    }
    
    
    func setView(){
        
        view.addSubview(displayTableView)
        displayTableView.delegate = self
        displayTableView.dataSource = self
        displayTableView.register(RecordTV_Cell.self, forCellReuseIdentifier: "RecordTV_Cell")
        displayTableView.translatesAutoresizingMaskIntoConstraints = false
        displayTableView.backgroundColor = .clear
        
        
        NSLayoutConstraint.activate([
            
            displayTableView.topAnchor.constraint(equalTo: view.safeTopAnchor),
            displayTableView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            displayTableView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -4),
            displayTableView.heightAnchor.constraint(equalTo: view.heightAnchor),
        ])
    }
}


extension RecordViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 3
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecordTV_Cell", for: indexPath) as! RecordTV_Cell
        cell.setCellView()
        cell.backgroundColor = .clear
        cell.overLayButton.tag = indexPath.row
        cell.overLayButton.addTarget(self, action: #selector(cellSelected), for: .touchUpInside)
        cell.titleLabel.text = "\(indexPath.row)選手になりたい"
        
        
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
        vc.dreamValue = "\(sender.tag)"
        
        
        let nvc = UINavigationController(rootViewController: vc)
        nvc.modalPresentationStyle = .fullScreen
        
        
        self.present(nvc, animated: true)
    }
}
