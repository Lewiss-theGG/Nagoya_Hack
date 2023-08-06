//
//  RecordDetailViewController.swift
//  GeekWhat2Do
//
//  Created by gkin on 2023/08/02.
//

import UIKit
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift


class DetailRecordView: UIViewController{
    
    let table = UITableView()
    
    
    var record = Record(id: String(), whatToBe: String(), declaredAt: Date(), period_Y: Int(), period_M: Int(), response: Response(todo: [], detail: [], map: []))
        
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        view.baseColor(backgroundColor: .secondarySystemBackground, opacity: 1)
        
        
        setView()
        title = record.whatToBe
        setLeft(leftBarTitle: "<")
    }
    
    
    func setView(){
        
        view.addSubview(table)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.baseColor()
        table.separatorStyle = .none
        table.clipsToBounds = true
        table.delegate = self
        table.dataSource = self
        table.register(TargetImageCell.self, forCellReuseIdentifier: "TargetImageCell")
        table.register(TargetLabelCell.self, forCellReuseIdentifier: "TargetLabelCell")
        table.register(TargetTextCell.self, forCellReuseIdentifier: "TargetTextCell")
        table.register(TargetHeaderCell.self, forCellReuseIdentifier: "TargetHeaderCell")
                
        
        NSLayoutConstraint.activate([
            
            table.topAnchor.constraint(equalTo: view.safeTopAnchor),
            table.leftAnchor.constraint(equalTo: view.leftAnchor),
            table.rightAnchor.constraint(equalTo: view.rightAnchor),
            table.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}


extension DetailRecordView: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 4 + roadMapping().count + 1 + roadDetailing().count + 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "TargetImageCell", for: indexPath) as! TargetImageCell
            cell.cellSetView()
            
            cell.imageView?.image = UIImage()
            cell.imageView?.baseColor(backgroundColor: .link)
            
            return cell
        }
        
        else if indexPath.row == 1{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "TargetLabelCell", for: indexPath) as! TargetLabelCell
            cell.cellSetView()
            
            cell.topLabel.text = "期間："

            
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy年MM月dd日"
            
            
            let declaredAt: String = formatter.string(from: record.declaredAt )
            if record.period_M == 0{
                
                cell.targetlabel.text = "\(declaredAt)から\(record.period_Y) 年間"
            }
            else if record.period_Y == 0{
                
                cell.targetlabel.text = "\(declaredAt)から\(record.period_M) ヶ月間"
            }
            else {
                
                cell.targetlabel.text = "\(declaredAt)から\(record.period_Y) 年 \(record.period_M) ヶ月間"
            }
            
            
            return cell
        }
        
        else if indexPath.row == 2{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "TargetHeaderCell", for: indexPath) as! TargetHeaderCell
            cell.cellSetView()
            cell.contentView.curveHalfTop(value: 10)
            cell.label.text = "ロードマップ"
            
            return cell
        }
        
        else if indexPath.row >= 3 && indexPath.row < 3 + roadMapping().count{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "TargetTextCell", for: indexPath) as! TargetTextCell
            
            let mapText = roadMapping()
            let text = mapText[indexPath.row - 3]
            
            cell.cellSetView()
            
            if text.contains(":") || text.contains("："){
                cell.textView.font = .monospacedSystemFont(ofSize: 18, weight: .semibold)
            }
            else{
                cell.textView.font = .monospacedSystemFont(ofSize: 12, weight: .thin)
            }
            
            cell.textView.text = text
            
            return cell
        }
        else if indexPath.row == 3 + roadMapping().count{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "TargetHeaderCell", for: indexPath) as! TargetHeaderCell
            cell.contentView.curveHalfBottom(value: 10)
            cell.cellSetView()
            return cell
        }
        
        else if indexPath.row == 4 + roadMapping().count{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "TargetHeaderCell", for: indexPath) as! TargetHeaderCell
            cell.cellSetView()
            cell.contentView.curveHalfTop(value: 10)
            cell.label.text = "具体的なアドバイス"
            return cell
        }
        
        else if indexPath.row >= 4 + roadMapping().count + 1 && indexPath.row < 4 + roadMapping().count + 1 + roadDetailing().count{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "TargetTextCell", for: indexPath) as! TargetTextCell
            
            let mapText = roadDetailing()
            let text = mapText[indexPath.row - (5 +  roadMapping().count)]
            
            cell.cellSetView()
            
            if record.response.todo.contains(text)
            {
                cell.textView.font = .monospacedSystemFont(ofSize: 18, weight: .semibold)
            }
            else{
                cell.textView.font = .monospacedSystemFont(ofSize: 12, weight: .thin)
            }
            
            cell.textView.text = text
            
            return cell
        }
        
        else if indexPath.row == 4 + roadMapping().count + 1 + roadDetailing().count{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "TargetHeaderCell", for: indexPath) as! TargetHeaderCell
            cell.contentView.curveHalfBottom(value: 10)
            cell.cellSetView()
            cell.label.text = ""
            return cell
        }
        
        
        return UITableViewCell()
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        
        if indexPath.row == 0{
            
            return view.width*3/4
        }
        
        else if indexPath.row == 1{
            
            return 100
        }
        
        else if indexPath.row == 2{
            
            return 50
        }
        
        else if indexPath.row >= 3 && indexPath.row < 3 + roadMapping().count{
            
            tableView.estimatedRowHeight = 100
            return UITableView.automaticDimension
        }
        else if indexPath.row == 3 + roadMapping().count{
            
            return 50
        }
        
        else if indexPath.row == 4 + roadMapping().count{
            
            return 50
        }
        
        else if indexPath.row >= 4 + roadMapping().count + 1 && indexPath.row < 4 + roadMapping().count + 1 + roadDetailing().count{
            
            tableView.estimatedRowHeight = 100
            return UITableView.automaticDimension
        }
        else{
            
            return 50
        }
    }
    
    
    
    func roadMapping() -> [String]{
        
        var mapText: [String] = []
        
        
        for i in record.response.map{
            
            if i == record.response.map.first{
                
                mapText.append("\(i)")
            }
            
            else if i.contains(":") || i.contains("："){
                
                mapText.append("\(i)")
            }
            
            else{
                
                mapText.append("\(i)")
            }
        }
        
        
        return mapText
    }
    
    
    func roadDetailing() -> [String]{
        
        var detailText: [String] = []
        
        for i in record.response.detail{
            
            detailText.append("\(i)")
        }
        return detailText
    }
}
