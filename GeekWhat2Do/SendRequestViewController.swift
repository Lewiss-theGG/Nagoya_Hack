//
//  SendRequestViewController.swift
//  GeekWhat2Do
//
//  Created by gkin on 2023/07/29.
//

import UIKit
import KMPlaceholderTextView


class SendRequestViewController: UIViewController {
    
    var targetYear = 1
    
    
    var targetMonth = 0
    
    
    let memoSheetImageView = UIImageView()
    
    
    let targetLabel = UILabel()
    
    
    let targetTextField = KMPlaceholderTextView()
    
    
    let typeCounterLabel = UILabel()
    
    
    let targetYearLabel = UILabel()
    
    
    let pickerButtton = UIButton()
    
    
    let targetPicker = UIPickerView()
    
    
    let hidePickerButton = UIButton()
    
    
    let submitButton = UIButton()
    
    
    let returnButton = UIButton()
    
    
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
        memoSheetImageView.alpha = 0.8
        
        
        view.addSubview(targetLabel)
        targetLabel.translatesAutoresizingMaskIntoConstraints = false
        targetLabel.baseFont(font: .monospacedSystemFont(ofSize: 25, weight: .semibold))
        targetLabel.baseTextColor()
        targetLabel.baseColor(backgroundColor: .clear)
        targetLabel.text = "何になりたい？何がしたい？"
        
        
        view.addSubview(targetTextField)
        targetTextField.delegate = self
        targetTextField.translatesAutoresizingMaskIntoConstraints = false
        targetTextField.font = UIFont(name: "APJapanesefont", size: 22)
        targetTextField.baseTextColor()
        targetTextField.placeholder = "…になりたい"
        targetTextField.clipsToBounds = true
        targetTextField.layer.cornerRadius = 10
        targetTextField.baseColor(opacity: 0.25)
        targetTextField.isScrollEnabled = false
        
        
        view.addSubview(typeCounterLabel)
        typeCounterLabel.translatesAutoresizingMaskIntoConstraints = false
        typeCounterLabel.baseFont(font: .monospacedSystemFont(ofSize: 15, weight: .thin))
        typeCounterLabel.baseTextColor()
        typeCounterLabel.textAlignment = .right
        typeCounterLabel.text = "0 / 50"
        typeCounterLabel.baseColor(backgroundColor: .clear)
        
        
        view.addSubview(targetYearLabel)
        targetYearLabel.translatesAutoresizingMaskIntoConstraints = false
        targetYearLabel.baseFont(font: .monospacedSystemFont(ofSize: 25, weight: .semibold))
        targetYearLabel.baseTextColor()
        targetYearLabel.baseColor(backgroundColor: .clear)
        targetYearLabel.text = "どれくらいでなりたい？"
        
        
        view.addSubview(pickerButtton)
        pickerButtton.translatesAutoresizingMaskIntoConstraints = false
        pickerButtton.setTitleColor(.label, for: .normal)
        pickerButtton.titleLabel?.font = UIFont(name: "APJapanesefont", size: 22)
        pickerButtton.setTitle("\(targetYear) 年でなりたい", for: .normal)
        pickerButtton.baseColor(opacity: 0.25)
        pickerButtton.clipsToBounds = true
        pickerButtton.layer.cornerRadius = 10
        pickerButtton.pressAction()
        pickerButtton.addTarget(self, action: #selector(openPicker), for: .touchUpInside)
        
        
        view.addSubview(targetPicker)
        targetPicker.translatesAutoresizingMaskIntoConstraints = false
        targetPicker.delegate = self
        targetPicker.dataSource = self
        targetPicker.isHidden = true
        targetPicker.baseColor()
        targetPicker.clipsToBounds = true
        targetPicker.layer.cornerRadius = 10
        targetPicker.selectRow(1, inComponent: 0, animated: false)
        
        
        view.addSubview(hidePickerButton)
        hidePickerButton.translatesAutoresizingMaskIntoConstraints = false
        hidePickerButton.clipsToBounds = true
        hidePickerButton.isHidden = true
        hidePickerButton.layer.cornerRadius = 10
        hidePickerButton.baseColor(backgroundColor: .label, opacity: 0.25)
        hidePickerButton.pressAction()
        hidePickerButton.setTitle("OK", for: .normal)
        hidePickerButton.setTitleColor(.link, for: .normal)
        hidePickerButton.titleLabel?.font = .monospacedSystemFont(ofSize: 20, weight: .regular)
        hidePickerButton.addTarget(self, action: #selector(hidePicker), for: .touchUpInside)
        
        
        view.addSubview(submitButton)
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        submitButton.baseColor(backgroundColor: .systemYellow, opacity: 0.8)
        submitButton.titleLabel?.baseTextColor()
        submitButton.titleLabel?.font = .monospacedSystemFont(ofSize: 25, weight: .semibold)
        submitButton.isHidden = false
        submitButton.clipsToBounds = true
        submitButton.layer.cornerRadius = 10
        submitButton.setTitle("相談する", for: .normal)
        submitButton.pressAction()
        submitButton.addTarget(self, action: #selector(transRequest), for: .touchUpInside)
        
                
        NSLayoutConstraint.activate([
            
            memoSheetImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            memoSheetImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            memoSheetImageView.heightAnchor.constraint(equalTo: view.safeHeightAnchor, multiplier: 0.8),
            memoSheetImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            
            targetLabel.topAnchor.constraint(equalTo: memoSheetImageView.topAnchor, constant: 150),
            targetLabel.leftAnchor.constraint(equalTo: memoSheetImageView.leftAnchor, constant: 20),
            targetLabel.rightAnchor.constraint(equalTo: memoSheetImageView.rightAnchor, constant: -20),
            targetLabel.heightAnchor.constraint(equalToConstant: 50),
            
            
            targetTextField.topAnchor.constraint(equalTo: targetLabel.bottomAnchor, constant: 4),
            targetTextField.centerXAnchor.constraint(equalTo: memoSheetImageView.centerXAnchor),
            targetTextField.widthAnchor.constraint(equalTo: memoSheetImageView.widthAnchor, multiplier: 0.8),
            targetTextField.heightAnchor.constraint(equalTo:  targetTextField.widthAnchor, multiplier: 0.4),
            
            
            typeCounterLabel.topAnchor.constraint(equalTo: targetTextField.bottomAnchor, constant: 4),
            typeCounterLabel.centerXAnchor.constraint(equalTo: targetTextField.centerXAnchor),
            typeCounterLabel.widthAnchor.constraint(equalTo: targetTextField.widthAnchor),
            typeCounterLabel.heightAnchor.constraint(equalToConstant: 30),
            
            
            targetYearLabel.topAnchor.constraint(equalTo: typeCounterLabel.bottomAnchor, constant: 15),
            targetYearLabel.leftAnchor.constraint(equalTo: memoSheetImageView.leftAnchor, constant: 20),
            targetYearLabel.rightAnchor.constraint(equalTo: memoSheetImageView.rightAnchor, constant: -20),
            targetYearLabel.heightAnchor.constraint(equalToConstant: 50),
            
            
            pickerButtton.topAnchor.constraint(equalTo: targetYearLabel.bottomAnchor, constant: 4),
            pickerButtton.centerXAnchor.constraint(equalTo: memoSheetImageView.centerXAnchor),
            pickerButtton.widthAnchor.constraint(equalTo: memoSheetImageView.widthAnchor, multiplier: 0.8),
            pickerButtton.heightAnchor.constraint(equalToConstant: 50),
            
            
            targetPicker.bottomAnchor.constraint(equalTo: view.safeBottomAnchor),
            targetPicker.widthAnchor.constraint(equalTo: memoSheetImageView.widthAnchor, multiplier: 0.8),
            targetPicker.centerXAnchor.constraint(equalTo: memoSheetImageView.centerXAnchor),
            targetPicker.heightAnchor.constraint(equalTo: view.safeHeightAnchor, multiplier: 0.15),
            
            
            hidePickerButton.topAnchor.constraint(equalTo: targetPicker.topAnchor),
            hidePickerButton.rightAnchor.constraint(equalTo: targetPicker.rightAnchor),
            hidePickerButton.widthAnchor.constraint(equalToConstant: 50),
            hidePickerButton.heightAnchor.constraint(equalToConstant: 30),
            
            
            submitButton.bottomAnchor.constraint(equalTo: targetPicker.bottomAnchor),
            submitButton.widthAnchor.constraint(equalTo: targetPicker.widthAnchor, multiplier: 0.5),
            submitButton.centerXAnchor.constraint(equalTo: targetPicker.centerXAnchor),
            submitButton.heightAnchor.constraint(equalTo: targetPicker.heightAnchor, multiplier: 0.3),
        ])
    }
    
    
    @objc func openPicker(){
        
        submitButton.isHidden = true
        hidePickerButton.isHidden = false
        targetPicker.isHidden = false
    }
    
    
    @objc func hidePicker(){
        
        submitButton.isHidden = false
        hidePickerButton.isHidden = true
        targetPicker.isHidden = true
    }
    
    
    @objc func transRequest(){
        
        let vc = ChatViewController()
        
        
        guard let targetTextField_text = targetTextField.text, targetTextField_text.isEmpty != true else{return}
        
        
        guard let pickerButtton_text = pickerButtton.titleLabel?.text, pickerButtton_text.isEmpty != true else{return}
        
        
        vc.content = "\(targetTextField_text)に\(pickerButtton_text)。箇条書きで教えて"
        let nvc = UINavigationController(rootViewController: vc)
        nvc.modalPresentationStyle = .fullScreen
        self.present(nvc, animated: true)
    }
}



extension SendRequestViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 4
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        switch component {
            
        case 0:
            return 11
            
        case 2:
            return 12
            
        default:
            return 1
        }
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        switch component {
            
        case 0:
            return "\(row)"
            
        case 2:
            return "\(row)"
            
        case 1:
            return "年"
            
        default:
            return "ヶ月"
        }
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        switch component {
            
        case 0:
            
            targetYear = row
            
            
            if row == 0 && targetMonth == 0{
                
                targetMonth = 1
                pickerView.selectRow(1, inComponent: 2, animated: true)
            }
            
            
            if targetMonth == 0{
                
                pickerButtton.setTitle("\(targetYear) 年でなりたい", for: .normal)
            }
            else if targetYear == 0{
                
                pickerButtton.setTitle("\(targetMonth) ヶ月でなりたい", for: .normal)
            }
            else {
                
                pickerButtton.setTitle("\(targetYear) 年 \(targetMonth) ヶ月でなりたい", for: .normal)
            }
            
        case 2:
            
            targetMonth = row
            
            
            if row == 0 && targetYear == 0{
                
                targetYear = 1
                pickerView.selectRow(1, inComponent: 0, animated: true)
            }
            
            
            if targetMonth == 0{
                
                pickerButtton.setTitle("\(targetYear) 年でなりたい", for: .normal)
            }
            else if targetYear == 0{
                
                pickerButtton.setTitle("\(targetMonth) ヶ月でなりたい", for: .normal)
            }
            else {
                
                pickerButtton.setTitle("\(targetYear) 年 \(targetMonth) ヶ月でなりたい", for: .normal)
            }
            
       default:
            
            break
        }
    }
}


extension SendRequestViewController: UITextViewDelegate{
    
    func textViewDidChange(_ textView: UITextView) {
        
        if textView.text.count > 50{
            
            let txt = textView.text.dropLast(textView.text.count - 50)
            textView.text = "\(txt)"
        }
        
        typeCounterLabel.text = "\(textView.text.count) / 50"
    }
}
