//
//  SendRequestViewController.swift
//  GeekWhat2Do
//
//  Created by gkin on 2023/07/29.
//

import UIKit

class SendRequestViewController: UIViewController {
    
    let memoSheetImageView = UIImageView()
    
    
    let targetLabel = UILabel()
    
    
    let targetTextField = UITextField()
    
    
    let targetYearLabel = UILabel()
    
    
    let targetPickerView = UIPickerView()
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        setView()
    }
    
    
    func setView(){
        
        view.addSubview(memoSheetImageView)
        memoSheetImageView.translatesAutoresizingMaskIntoConstraints = false
        memoSheetImageView.image = #imageLiteral(resourceName: "sample_memo_sheet").withRenderingMode(.alwaysOriginal)
        memoSheetImageView.clipsToBounds = true
        memoSheetImageView.contentMode = .scaleAspectFit
        
        
        view.addSubview(targetLabel)
        targetLabel.translatesAutoresizingMaskIntoConstraints = false
        targetLabel.baseFont(font: .monospacedSystemFont(ofSize: 20, weight: .bold))
        targetLabel.baseTextColor()
        targetLabel.baseColor(backgroundColor: .clear)
        targetLabel.text = "教えてもらいたいものは？"
        
        
        view.addSubview(targetTextField)
        targetTextField.translatesAutoresizingMaskIntoConstraints = false
        targetTextField.font = UIFont(name: "えり字", size: 20)
        targetTextField.baseTextColor()
        targetTextField.baseColor(backgroundColor: .clear)
        targetTextField.toggleUnderline(self)
        targetTextField.placeholder = "〜なりたい？"
        
        
        view.addSubview(targetYearLabel)
        targetYearLabel.translatesAutoresizingMaskIntoConstraints = false
        targetYearLabel.baseFont(font: .monospacedSystemFont(ofSize: 20, weight: .bold))
        targetYearLabel.baseTextColor()
        targetYearLabel.baseColor(backgroundColor: .clear)
        targetYearLabel.text = "どれくらいでなりたい？"
        
        
        view.addSubview(targetPickerView)
        targetPickerView.translatesAutoresizingMaskIntoConstraints = false
        targetPickerView.delegate = self
        targetPickerView.dataSource = self
        targetPickerView.backgroundColor = .clear
        
        
        NSLayoutConstraint.activate([
            
            memoSheetImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            memoSheetImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            memoSheetImageView.heightAnchor.constraint(equalTo: view.safeHeightAnchor, multiplier: 0.8),
            memoSheetImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            
            targetLabel.topAnchor.constraint(equalTo: memoSheetImageView.topAnchor, constant: 150),
            targetLabel.leftAnchor.constraint(equalTo: memoSheetImageView.leftAnchor, constant: 20),
            targetLabel.rightAnchor.constraint(equalTo: memoSheetImageView.rightAnchor, constant: -20),
            targetLabel.heightAnchor.constraint(equalTo:  memoSheetImageView.heightAnchor, multiplier: 1/6, constant: -25),
            
            
            targetTextField.topAnchor.constraint(equalTo: targetLabel.bottomAnchor, constant: 4),
            targetTextField.leftAnchor.constraint(equalTo: memoSheetImageView.leftAnchor, constant: 20),
            targetTextField.rightAnchor.constraint(equalTo: memoSheetImageView.rightAnchor, constant: -20),
            targetTextField.heightAnchor.constraint(equalToConstant: 50),
            
            
            targetYearLabel.topAnchor.constraint(equalTo: targetTextField.bottomAnchor, constant: 20),
            targetYearLabel.leftAnchor.constraint(equalTo: memoSheetImageView.leftAnchor, constant: 20),
            targetYearLabel.rightAnchor.constraint(equalTo: memoSheetImageView.rightAnchor, constant: -20),
            targetYearLabel.heightAnchor.constraint(equalTo:  memoSheetImageView.heightAnchor, multiplier: 1/6, constant: -25),
            
            
            targetPickerView.topAnchor.constraint(equalTo: targetYearLabel.bottomAnchor, constant: 4),
            targetPickerView.leftAnchor.constraint(equalTo: memoSheetImageView.leftAnchor, constant: 20),
            targetPickerView.rightAnchor.constraint(equalTo: memoSheetImageView.rightAnchor, constant: -20),
            targetPickerView.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}



extension SendRequestViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 1
    }
}
