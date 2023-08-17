//
//  AttendDetailViewController.swift
//  GeekWhat2Do
//
//  Created by gkin on 2023/08/14.
//

import UIKit

class AttendDetailViewController: UIViewController {
    
    var _eventID = String()
    
    
    var eventData: Event = Event(eventAt: String(),
                                 eventAttendance: Int(),
                                 eventCount: Int(),
                                 eventDetail: String(),
                                 eventDistributed: Int(),
                                 eventDate: Date(),
                                 eventID: String(),
                                 eventName: String())  //eventID

    
    let baseView = GradationView()
    
    
    let titleLabel = UILabel()
    var titleValue = String()
    
    
    let rewardLabel = UILabel()
    var rewardValue = String()
    
    
    let atLabel = UILabel()
    var atValue = String()
    
    
    let dateLabel = UILabel()
    
    
    let descriptionTable = UITableView()
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.baseColor()
        
        
        self.setLeft(leftBarTitle: "<")
        self.setView()
        
        
        let globalQ = DispatchQueue.global()
        globalQ.sync {
            
            self.getEventData()
        }
    }
    
    
    final func getEventData(){
        
        Database().event.document(_eventID).getDocument { document, error in
            
            if let error = error{
                
                print(error.localizedDescription)
                return
            }
            
            if let document = document, document.exists {
                
                do {
                    
                    try self.eventData =  document.data(as: Event.self)
                    
                    self.setView()
                    self.descriptionTable.reloadData()
                    
                } catch {
                    print("Error decoding document: \(error)")
                }
                
            }
        }
    }
    
    
    
    
    func setView(){
        
        view.addSubview(baseView)
        baseView.addSubview(titleLabel)
        baseView.addSubview(rewardLabel)
        baseView.addSubview(atLabel)
        baseView.addSubview(dateLabel)
        
        
        view.addSubview(descriptionTable)
        
        
        baseView.clipsToBounds = true
        baseView.curveHalfBottom(value: 10)
        baseView.setGradation(gradientStartColor: .systemPink.withAlphaComponent(0.1))
        baseView.translatesAutoresizingMaskIntoConstraints = false
        
        
        //titleLabel.text = "参加実績"
        titleLabel.baseFont(font: .monospacedSystemFont(ofSize: 30, weight: .semibold))
        titleLabel.baseTextColor(textColor: .systemBackground)
        titleLabel.clipsToBounds = true
        titleLabel.layer.cornerRadius = 5
        titleLabel.baseColor(backgroundColor: .label, opacity: 0.05)
        titleLabel.textAlignment = .left
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "\(eventData.eventName)"
        
        
        //rewardLabel.text = "参加実績"
        rewardLabel.baseFont(font: .monospacedSystemFont(ofSize: 20, weight: .regular))
        rewardLabel.baseTextColor(textColor: .systemGray)
        rewardLabel.baseColor(backgroundColor: .clear)
        rewardLabel.textAlignment = .left
        rewardLabel.translatesAutoresizingMaskIntoConstraints = false
        rewardLabel.text = "\(rewardValue) SSC獲得"
        
        
        atLabel.baseFont(font: .monospacedSystemFont(ofSize: 18, weight: .semibold))
        atLabel.baseTextColor(textColor: .systemBackground)
        atLabel.baseColor(backgroundColor: .systemTeal)
        atLabel.clipsToBounds = true
        atLabel.layer.cornerRadius = 10
        atLabel.textAlignment = .center
        atLabel.translatesAutoresizingMaskIntoConstraints = false
        atLabel.text = "\(eventData.eventAt)"
        
        
        dateLabel.baseFont(font: .monospacedSystemFont(ofSize: 12, weight: .thin))
        dateLabel.baseTextColor(textColor: .label)
        dateLabel.baseColor(backgroundColor: .clear)
        dateLabel.textAlignment = .right
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        let formatter = DateFormatter()
        formatter.dateFormat = "yy年MM月dd日"
        dateLabel.text = "\(formatter.string(from: eventData.eventDate))"
        
        
        descriptionTable.delegate = self
        descriptionTable.dataSource = self
        descriptionTable.register(TargetTextCell.self, forCellReuseIdentifier: "TargetTextCell")
        descriptionTable.register(attendTitleValueCell.self, forCellReuseIdentifier: "attendTitleValueCell")
        descriptionTable.backgroundColor = .clear
        descriptionTable.separatorStyle = .none
        descriptionTable.isSpringLoaded = false
        descriptionTable.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            
            baseView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            baseView.topAnchor.constraint(equalTo: view.safeTopAnchor, constant: 10),
            baseView.heightAnchor.constraint(equalToConstant: 150 * 0.9),
            baseView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.99),
            
            
            titleLabel.centerXAnchor.constraint(equalTo: baseView.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: baseView.topAnchor, constant: 5),
            titleLabel.heightAnchor.constraint(equalToConstant: 40),
            titleLabel.widthAnchor.constraint(equalTo: baseView.widthAnchor, multiplier: 0.9),
            
            
            rewardLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            rewardLabel.leftAnchor.constraint(equalTo: titleLabel.leftAnchor, constant: 5),
            rewardLabel.heightAnchor.constraint(equalToConstant: 40),
            rewardLabel.widthAnchor.constraint(equalTo: titleLabel.widthAnchor, multiplier: 0.9),
            
            
            atLabel.bottomAnchor.constraint(equalTo: baseView.bottomAnchor, constant: -10),
            atLabel.leftAnchor.constraint(equalTo: titleLabel.leftAnchor),
            atLabel.widthAnchor.constraint(equalTo: baseView.widthAnchor, multiplier: 0.3),
            atLabel.heightAnchor.constraint(equalToConstant: 30),
            
            
            dateLabel.rightAnchor.constraint(equalTo: baseView.rightAnchor, constant: -5),
            dateLabel.heightAnchor.constraint(equalToConstant: 30),
            dateLabel.bottomAnchor.constraint(equalTo: baseView.bottomAnchor, constant: -10),
            dateLabel.leftAnchor.constraint(equalTo: atLabel.rightAnchor, constant: -5),
            
            
            descriptionTable.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            descriptionTable.topAnchor.constraint(equalTo: baseView.bottomAnchor, constant: 30),
            descriptionTable.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            descriptionTable.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.99),
        ])
    }
}



extension AttendDetailViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 5
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row != 1{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "attendTitleValueCell", for: indexPath) as! attendTitleValueCell
            
            
            switch indexPath.row {
                
            case 0:
                cell.cellSetView(titleFont: .monospacedSystemFont(ofSize: 30, weight: .semibold),
                                 titleTextColor: .systemGray,
                                 valueFont: .monospacedSystemFont(ofSize: 20, weight: .semibold),
                                 valueTextColor: .clear)
                
                cell.titleLabel.text = "イベント内容"
                
            case 2:
                cell.cellSetView(titleFont: .monospacedSystemFont(ofSize: 20, weight: .semibold),
                                 titleTextColor: .systemGray,
                                 valueFont: .monospacedSystemFont(ofSize: 20, weight: .semibold),
                                 valueTextColor: .link)
                
                cell.titleLabel.text = "トークンの配布量"
                cell.valueLabel.text = "\(eventData.eventDistributed) SSC"
                
            case 3:
                cell.cellSetView(titleFont: .monospacedSystemFont(ofSize: 20, weight: .semibold),
                                 titleTextColor: .systemGray,
                                 valueFont: .monospacedSystemFont(ofSize: 20, weight: .semibold),
                                 valueTextColor: .link)
                
                cell.titleLabel.text = "イベント参加人数"
                cell.valueLabel.text = "\(eventData.eventAttendance) 人"
                
                
            case 4:
                cell.cellSetView(titleFont: .monospacedSystemFont(ofSize: 20, weight: .semibold),
                                 titleTextColor: .systemGray,
                                 valueFont: .monospacedSystemFont(ofSize: 20, weight: .semibold),
                                 valueTextColor: .link)
                
                cell.titleLabel.text = "イベント実施回数"
                cell.valueLabel.text = "\(eventData.eventCount) 回"
                
            default:
                break
            }
            
            
            return cell
        }
        else{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "TargetTextCell", for: indexPath) as! TargetTextCell
            
            cell.cellSetView()
            cell.textView.text = "\(eventData.eventDetail)"
            
            return cell
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.row {
        case 0:
            return 50
            
        case 1:
            tableView.estimatedRowHeight = 100
            return UITableView.automaticDimension
            
        default:
            return 40
        }
    }
}
