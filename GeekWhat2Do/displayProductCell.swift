//
//  displayProductCell.swift
//  GeekWhat2Do
//
//  Created by gkin on 2023/08/14.
//

import UIKit


class disPlayProductCell: UITableViewCell {
    
    let baseView = GradationView()
    
    
    let atLabel = UILabel()
    
    
    let priceLabel = UILabel()
    
    
    let productImage = UIImageView()
    
    
    let productName = UILabel()
    

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
        baseView.addSubview(atLabel)
        baseView.addSubview(priceLabel)
        baseView.addSubview(productImage)
        baseView.addSubview(productName)
        
        
        baseView.clipsToBounds = true
        baseView.layer.cornerRadius = 10
        baseView.setGradation(gradientStartColor: .systemTeal.withAlphaComponent(0.1))
        baseView.translatesAutoresizingMaskIntoConstraints = false
        
        
        atLabel.baseFont(font: .monospacedSystemFont(ofSize: 18, weight: .semibold))
        atLabel.baseTextColor(textColor: .systemBackground)
        atLabel.baseColor(backgroundColor: .systemTeal)
        atLabel.clipsToBounds = true
        atLabel.layer.cornerRadius = 10
        atLabel.textAlignment = .center
        atLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        priceLabel.baseFont()
        priceLabel.baseTextColor(textColor: .label)
        priceLabel.baseColor(backgroundColor: .clear)
        priceLabel.textAlignment = .right
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        productImage.contentMode = .scaleAspectFill
        productImage.clipsToBounds = true
        productImage.layer.cornerRadius = 10
        productImage.translatesAutoresizingMaskIntoConstraints = false
        
        
        productName.baseFont(font: .monospacedSystemFont(ofSize: 30, weight: .semibold))
        productName.baseTextColor(textColor: .systemBackground)
        productName.clipsToBounds = true
        productName.layer.cornerRadius = 5
        productName.baseColor(backgroundColor: .label, opacity: 0.05)
        productName.textAlignment = .left
        productName.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            
            baseView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            baseView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            baseView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.9),
            baseView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.9),
            
            
            atLabel.topAnchor.constraint(equalTo: baseView.topAnchor, constant: 10),
            atLabel.leftAnchor.constraint(equalTo: baseView.leftAnchor, constant: 10),
            atLabel.widthAnchor.constraint(equalTo: baseView.widthAnchor, multiplier: 0.4),
            atLabel.heightAnchor.constraint(equalToConstant: 30),
            
            
            priceLabel.topAnchor.constraint(equalTo: baseView.topAnchor, constant: 10),
            priceLabel.leftAnchor.constraint(equalTo: atLabel.rightAnchor, constant: 20),
            priceLabel.rightAnchor.constraint(equalTo: baseView.rightAnchor, constant: -10),
            priceLabel.heightAnchor.constraint(equalToConstant: 30),
            
            
            productImage.topAnchor.constraint(equalTo: atLabel.bottomAnchor, constant: 10),
            productImage.leftAnchor.constraint(equalTo: atLabel.leftAnchor),
            productImage.widthAnchor.constraint(equalTo: atLabel.widthAnchor),
            productImage.heightAnchor.constraint(equalTo: atLabel.widthAnchor),
            
            
            productName.centerYAnchor.constraint(equalTo: productImage.centerYAnchor),
            productName.leftAnchor.constraint(equalTo: priceLabel.leftAnchor),
            productName.rightAnchor.constraint(equalTo: priceLabel.rightAnchor),
            productName.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
}
