//
//  RecordViewController.swift
//  GeekWhat2Do
//
//  Created by gkin on 2023/08/01.
//

import UIKit

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
        
        
        let selectedBackgroundView = UIView(frame: cell.contentView.frame)
        selectedBackgroundView.backgroundColor = .clear
        cell.selectedBackgroundView = selectedBackgroundView
        
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return displayTableView.height / 4.2
    }
    
    
    @objc func cellSelected(_ sender: UIButton){
        
        print(sender.tag)
    }
}



class DetailRecordView: UIViewController{
    
    let shadowView = UIView()
    
    
    let baseView = UIView()
    
    
    let topLabel = UILabel()
    
    
    let titleLabel = UILabel()
    
    
    let aimLabel = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        view.baseColor(backgroundColor: .secondarySystemBackground, opacity: 1)
        
        
        setView()
        setLeft()
    }
    
    
    func setView(){
        
        view.addSubview(shadowView)
        shadowView.translatesAutoresizingMaskIntoConstraints = false
        shadowView.baseColor()
        shadowView.shadow(width: 0, height: 2, opacity: 0.6, radius: 4)
        
        
        view.addSubview(baseView)
        baseView.translatesAutoresizingMaskIntoConstraints = false
        baseView.baseColor()
        baseView.clipsToBounds = true
        baseView.curveHalfBottom(value: 10)
        
        
        baseView.addSubview(topLabel)
        topLabel.translatesAutoresizingMaskIntoConstraints = false
        topLabel.baseColor()
        topLabel.baseFont(font: .monospacedSystemFont(ofSize: 22, weight: .semibold))
        topLabel.baseTextColor()
        topLabel.text = "目標"
        topLabel.textAlignment = .left
        
        
        baseView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont(name: "APJapanesefont", size: 30)
        titleLabel.baseTextColor()
        titleLabel.baseColor(backgroundColor: .label, opacity: 0.05)
        titleLabel.numberOfLines = 0
        titleLabel.minimumScaleFactor = 0.71
        titleLabel.clipsToBounds = true
        titleLabel.layer.cornerRadius = 10
        titleLabel.text = "サッカー選手になりたい"
        
        
        baseView.addSubview(aimLabel)
        aimLabel.translatesAutoresizingMaskIntoConstraints = false
        aimLabel.baseColor()
        aimLabel.baseFont()
        aimLabel.baseTextColor()
        aimLabel.text = "7/27日から1年で達成する"  //・・・
        aimLabel.textAlignment = .left
        
        
        NSLayoutConstraint.activate([
            
            shadowView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            shadowView.topAnchor.constraint(equalTo: view.safeTopAnchor, constant: 20),
            shadowView.heightAnchor.constraint(equalTo: view.safeHeightAnchor, multiplier: (0.95/6), constant: 10),
            shadowView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -20),
            
            
            baseView.topAnchor.constraint(equalTo: shadowView.topAnchor, constant: -10),
            baseView.leftAnchor.constraint(equalTo: shadowView.leftAnchor, constant: -8),
            baseView.rightAnchor.constraint(equalTo: shadowView.rightAnchor, constant: 8),
            baseView.bottomAnchor.constraint(equalTo: shadowView.bottomAnchor),
            
            
            topLabel.topAnchor.constraint(equalTo: baseView.topAnchor),
            topLabel.leftAnchor.constraint(equalTo: baseView.leftAnchor, constant: 10),
            topLabel.heightAnchor.constraint(equalTo: baseView.heightAnchor, multiplier: 0.2),
            topLabel.widthAnchor.constraint(equalTo: baseView.widthAnchor, multiplier: 0.9),
            
            
            titleLabel.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 10),
            titleLabel.leftAnchor.constraint(equalTo: baseView.leftAnchor, constant: 10),
            titleLabel.widthAnchor.constraint(equalTo: baseView.widthAnchor, multiplier: 0.95),
            titleLabel.heightAnchor.constraint(equalTo: baseView.heightAnchor, multiplier: 0.3),
            
            
            aimLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            aimLabel.centerXAnchor.constraint(equalTo: baseView.centerXAnchor),
            aimLabel.widthAnchor.constraint(equalTo: titleLabel.widthAnchor),
            aimLabel.bottomAnchor.constraint(equalTo: baseView.bottomAnchor, constant: -10),
        ])
    }
}
