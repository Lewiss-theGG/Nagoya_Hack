//
//  attendCell.swift
//  GeekWhat2Do
//
//  Created by gkin on 2023/08/14.
//

import UIKit


class attendCell: UITableViewCell {
    
    
    let baseView = GradationView()
    
    
    let titleLabel = UILabel()
    
    
    let rewardLabel = UILabel()
    
    
    let atLabel = UILabel()
    
    
    let dateLabel = UILabel()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    func cellSetView(){
        
        contentView.addSubview(baseView)
        baseView.addSubview(titleLabel)
        baseView.addSubview(rewardLabel)
        baseView.addSubview(atLabel)
        baseView.addSubview(dateLabel)
        
        
        baseView.clipsToBounds = true
        baseView.layer.cornerRadius = 10
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
        
        
        //rewardLabel.text = "参加実績"
        rewardLabel.baseFont(font: .monospacedSystemFont(ofSize: 20, weight: .regular))
        rewardLabel.baseTextColor(textColor: .systemGray)
        rewardLabel.baseColor(backgroundColor: .clear)
        rewardLabel.textAlignment = .left
        rewardLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        atLabel.baseFont(font: .monospacedSystemFont(ofSize: 18, weight: .semibold))
        atLabel.baseTextColor(textColor: .systemBackground)
        atLabel.baseColor(backgroundColor: .systemTeal)
        atLabel.clipsToBounds = true
        atLabel.layer.cornerRadius = 10
        atLabel.textAlignment = .center
        atLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        dateLabel.baseFont(font: .monospacedSystemFont(ofSize: 12, weight: .thin))
        dateLabel.baseTextColor(textColor: .label)
        dateLabel.baseColor(backgroundColor: .clear)
        dateLabel.textAlignment = .right
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            
            baseView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            baseView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            baseView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.9),
            baseView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.9),
            
            
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
            atLabel.widthAnchor.constraint(equalTo: baseView.widthAnchor, multiplier: 0.4),
            atLabel.heightAnchor.constraint(equalToConstant: 30),
            
            
            dateLabel.rightAnchor.constraint(equalTo: baseView.rightAnchor, constant: -5),
            dateLabel.heightAnchor.constraint(equalToConstant: 30),
            dateLabel.bottomAnchor.constraint(equalTo: baseView.bottomAnchor, constant: -10),
            dateLabel.leftAnchor.constraint(equalTo: atLabel.rightAnchor, constant: -5),
        ])
    }
}
