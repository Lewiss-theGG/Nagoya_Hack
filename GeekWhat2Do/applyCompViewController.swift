//
//  applyCompViewController.swift
//  GeekWhat2Do
//
//  Created by gkin on 2023/08/17.
//

import UIKit

class applyCompViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground

        
        let label = UILabel()
        label.contentMode = .center
        label.textAlignment = .center
        label.baseFont(font: .monospacedSystemFont(ofSize: 20, weight: .bold))
        label.baseTextColor()
        label.baseColor()
        label.text = "申請を受け付けました"
        
        
        let iconLabel = UILabel()
        iconLabel.contentMode = .center
        iconLabel.textAlignment = .center
        iconLabel.baseFont(font: .monospacedSystemFont(ofSize: 30, weight: .bold))
        iconLabel.baseTextColor()
        iconLabel.baseColor()
        iconLabel.text = "🔆"
        
        view.addSubview(label)
        view.addSubview(iconLabel)
        
        
        label.translatesAutoresizingMaskIntoConstraints = false
        iconLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Set constraints for centering horizontally and vertically
        NSLayoutConstraint.activate([
            
            iconLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            iconLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),
            iconLabel.widthAnchor.constraint(equalToConstant: 50),
            iconLabel.heightAnchor.constraint(equalToConstant: 50),
            
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            label.widthAnchor.constraint(equalToConstant: 200),
            label.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    

    

}
