//
//  RecordTV_Cell.swift
//  GeekWhat2Do
//
//  Created by gkin on 2023/08/01.
//

import UIKit

class RecordTV_Cell: UITableViewCell {
    
    
    let baseView = UIView()
    
    
    let titleLabel = UILabel()
    
    
    let topLabel = UILabel()
    
    
    let overLayButton = UIButton()
    
    
    let editButton = UIButton()
    
    
    let aimLabel = UILabel()
    
    
    let progressBaseView = UIView()
    
    
    let progressView = UIView()
    
    
    let currentIcon = UIImageView()
    
    
    var progressPropotion: CGFloat = 0.1
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func setCellView(){
        
        contentView.shadow(width: 0, height: 2, opacity: 0.6, radius: 4)
        
        
        contentView.addSubview(baseView)
        baseView.translatesAutoresizingMaskIntoConstraints = false
        baseView.baseColor()
        baseView.clipsToBounds = true
        baseView.layer.cornerRadius = 10
        
        
        baseView.addSubview(topLabel)
        topLabel.translatesAutoresizingMaskIntoConstraints = false
        topLabel.baseColor()
        topLabel.baseFont(font: .monospacedSystemFont(ofSize: 22, weight: .semibold))
        topLabel.baseTextColor()
        topLabel.text = "7/27日に宣言！"  //・・・
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
        //titleLabel.text = "サッカー選手になりたい"
        
        
        contentView.addSubview(overLayButton)
        overLayButton.translatesAutoresizingMaskIntoConstraints = false
        overLayButton.baseColor(backgroundColor: .clear)
        overLayButton.clipsToBounds = true
        overLayButton.layer.cornerRadius = 10
        overLayButton.pressAction()
        
        
        contentView.addSubview(editButton)
        editButton.translatesAutoresizingMaskIntoConstraints = false
        editButton.baseColor(backgroundColor: .clear)
        editButton.setTitle("・・・", for: .normal)
        editButton.setTitleColor(.label, for: .normal)
        editButton.titleLabel?.baseFont(font: .monospacedSystemFont(ofSize: 18, weight: .semibold))
        editButton.pressAction()
        
        
        baseView.addSubview(aimLabel)
        aimLabel.translatesAutoresizingMaskIntoConstraints = false
        aimLabel.baseColor()
        aimLabel.baseFont()
        aimLabel.baseTextColor()
        aimLabel.text = "達成目標：1年"  //・・・
        aimLabel.textAlignment = .left
        
        
        baseView.addSubview(progressBaseView)
        progressBaseView.translatesAutoresizingMaskIntoConstraints = false
        progressBaseView.baseColor()
        progressBaseView.clipsToBounds = true
        progressBaseView.layer.borderWidth = 0.5
        progressBaseView.layer.borderColor = UIColor.label.cgColor
        
        
        baseView.addSubview(progressView)
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.baseColor(backgroundColor: .red, opacity: 0.5)
        
        
        baseView.addSubview(currentIcon)
        currentIcon.translatesAutoresizingMaskIntoConstraints = false
        currentIcon.baseColor(backgroundColor: .clear)
        currentIcon.contentMode = .scaleAspectFit
        currentIcon.image = UIImage(named: "progressMan")?.withRenderingMode(.alwaysOriginal)
        
        
        NSLayoutConstraint.activate([
            
            baseView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            baseView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            baseView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.95),
            baseView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.95),
            
            
            topLabel.topAnchor.constraint(equalTo: baseView.topAnchor, constant: 10),
            topLabel.leftAnchor.constraint(equalTo: baseView.leftAnchor, constant: 10),
            topLabel.heightAnchor.constraint(equalTo: baseView.heightAnchor, multiplier: 0.12),
            topLabel.widthAnchor.constraint(equalTo: baseView.widthAnchor, multiplier: 0.8),
            
            
            overLayButton.centerXAnchor.constraint(equalTo: baseView.centerXAnchor),
            overLayButton.centerYAnchor.constraint(equalTo: baseView.centerYAnchor),
            overLayButton.heightAnchor.constraint(equalTo: baseView.heightAnchor),
            overLayButton.widthAnchor.constraint(equalTo: baseView.widthAnchor),
            
            
            editButton.centerYAnchor.constraint(equalTo: topLabel.centerYAnchor),
            editButton.rightAnchor.constraint(equalTo: baseView.rightAnchor, constant: -5),
            editButton.heightAnchor.constraint(equalTo: baseView.heightAnchor, multiplier: 0.05),
            editButton.widthAnchor.constraint(equalToConstant: 20),
            
            
            titleLabel.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 10),
            titleLabel.leftAnchor.constraint(equalTo: baseView.leftAnchor, constant: 10),
            titleLabel.widthAnchor.constraint(equalTo: baseView.widthAnchor, multiplier: 0.95),
            titleLabel.heightAnchor.constraint(equalTo: baseView.heightAnchor, multiplier: 0.3),
            
            
            aimLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            aimLabel.leftAnchor.constraint(equalTo: baseView.leftAnchor, constant: 10),
            aimLabel.widthAnchor.constraint(equalTo: baseView.widthAnchor, multiplier: 0.95),
            aimLabel.heightAnchor.constraint(equalTo: baseView.heightAnchor, multiplier: 0.1),
            
            
            progressBaseView.topAnchor.constraint(equalTo: aimLabel.bottomAnchor, constant: 20),
            progressBaseView.centerXAnchor.constraint(equalTo: baseView.centerXAnchor),
            progressBaseView.widthAnchor.constraint(equalTo: baseView.widthAnchor, multiplier: 0.8),
            progressBaseView.heightAnchor.constraint(equalToConstant: 15),
            
            
            progressView.leftAnchor.constraint(equalTo: progressBaseView.leftAnchor),
            progressView.centerYAnchor.constraint(equalTo: progressBaseView.centerYAnchor),
            progressView.heightAnchor.constraint(equalTo: progressBaseView.heightAnchor, multiplier: 0.95),
            progressView.widthAnchor.constraint(equalTo: progressBaseView.widthAnchor, multiplier: progressPropotion),
            
            
            currentIcon.centerXAnchor.constraint(equalTo: progressView.rightAnchor),
            currentIcon.centerYAnchor.constraint(equalTo: progressView.centerYAnchor),
            currentIcon.heightAnchor.constraint(equalToConstant: 30),
            currentIcon.widthAnchor.constraint(equalToConstant: 30),
        ])
    }
}
