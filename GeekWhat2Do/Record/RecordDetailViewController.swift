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
    
    let shadowView = UIView()
    
    
    let baseView = UIView()
    
    
    let topLabel = UILabel()
    
    
    let titleLabel = UILabel()
    
    
    let aimLabel = UILabel()
    
    
    var dreamValue = String()
    
    
    let sampleView = UIButton()
    var counter: Int = 0
    
    
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
        titleLabel.text = "\(dreamValue)選手になりたい"
        
        
        baseView.addSubview(aimLabel)
        aimLabel.translatesAutoresizingMaskIntoConstraints = false
        aimLabel.baseColor()
        aimLabel.baseFont()
        aimLabel.baseTextColor()
        aimLabel.text = "7/27日から1年で達成する"  //・・・
        aimLabel.textAlignment = .left
        
        
        view.addSubview(sampleView)
        sampleView.frame = CGRect(x: 100, y: 600, width: view.width-200, height: view.width-600)
        sampleView.baseColor(backgroundColor: .red)
        sampleView.pressAction()
        sampleView.addTarget(self, action: #selector(move2), for: .touchUpInside)
        
        
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
    
    
    @objc func move2(){
        
        if counter%2 == 1{
            
            sampleView.frame = CGRect(x: 100, y: 600/4, width: view.width-200, height: view.width-600)
            sampleView.baseColor(backgroundColor: .red)
            counter += 1
        }
        else{
            
            sampleView.frame = CGRect(x: 100, y: 600, width: view.width-200, height: view.width-600)
            sampleView.baseColor(backgroundColor: .link)
            counter += 1
        }
    }
}
