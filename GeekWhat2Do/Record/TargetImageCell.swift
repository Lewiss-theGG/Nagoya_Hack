//
//  TargetImageCell.swift
//  GeekWhat2Do
//
//  Created by gkin on 2023/08/06.
//

import UIKit
import FirebaseAuth


class TargetImageCell: UITableViewCell {
    
    let targetImageView = UIImageView()
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func cellSetView(){
        
        contentView.addSubview(targetImageView)
        targetImageView.translatesAutoresizingMaskIntoConstraints = false
        targetImageView.contentMode = .scaleAspectFit
        
        
        NSLayoutConstraint.activate([
            
            targetImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            targetImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            targetImageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.95),
            targetImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.95),
        ])
    }
}


class TargetLabelCell: UITableViewCell {

    let topLabel = UILabel()
    
    
    let targetlabel = UILabel()
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func cellSetView(){
        
        contentView.addSubview(topLabel)
        topLabel.translatesAutoresizingMaskIntoConstraints = false
        topLabel.baseFont(font: .monospacedSystemFont(ofSize: 18, weight: .semibold))
        topLabel.baseTextColor()
        topLabel.textAlignment = .left
        
        
        contentView.addSubview(targetlabel)
        targetlabel.translatesAutoresizingMaskIntoConstraints = false
        targetlabel.baseFont(font: .monospacedSystemFont(ofSize: 20, weight: .semibold))
        targetlabel.baseTextColor()
        targetlabel.textAlignment = .center
        
        
        NSLayoutConstraint.activate([
            
            topLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            topLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            topLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.45),
            topLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.95),
            
            
            targetlabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            targetlabel.topAnchor.constraint(equalTo: topLabel.bottomAnchor),
            targetlabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.55),
            targetlabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.95),
        ])
    }
}



class TargetTextCell: UITableViewCell {
    
    let textView = UITextView()
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    func cellSetView(){
        
        contentView.backgroundColor = .label
        
        
        contentView.addSubview(textView)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.baseFont()
        textView.baseTextColor()
        textView.isScrollEnabled = false
        
        
        NSLayoutConstraint.activate([
            
            textView.topAnchor.constraint(equalTo: contentView.topAnchor),
            textView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            textView.widthAnchor.constraint(equalTo: contentView.widthAnchor, constant: -6),
            textView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
}


class TargetHeaderCell: UITableViewCell {
    
    let label = UILabel()
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    func cellSetView(){
        
        contentView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.baseFont(font: .monospacedSystemFont(ofSize: 30, weight: .bold))
        label.baseTextColor()
        label.baseColor()
        
        
        contentView.layer.borderColor = UIColor.label.cgColor
        contentView.layer.borderWidth = 3
        contentView.clipsToBounds = true
        
        
        NSLayoutConstraint.activate([
            
            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            label.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            label.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
        ])
    }
}
