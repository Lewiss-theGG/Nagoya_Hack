//
//  AuthViewController.swift
//  GeekWhat2Do
//
//  Created by gkin on 2023/07/23.
//

import UIKit
import FirebaseAuth


class AuthViewController: UIViewController {
    
    let backGroundGIFView = UIImageView()
    
    
    let contentView = UIView()
    
    
    let viewWithAlpha = UIView()
    
    
    let nameLabel = UILabel()
    
    
    let nametextField = UITextField()
    
    
    let emailLabel = UILabel()
    
    
    let emailTextField = UITextField()
    
    
    let pwdLabel = UILabel()
    
    
    let pwdTextField = UITextField()
    
    
    let registerButton = UIButton()
    

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setView()
    }
    
    
    func setView(){
        
        view.addSubview(backGroundGIFView)
        backGroundGIFView.frame = CGRect(x: view.left, y: view.top, width: view.width, height: view.height)
        backGroundGIFView.backgroundColor = .clear
        
        
        view.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.clipsToBounds = true
        contentView.layer.cornerRadius = 10
        
        
        contentView.addSubview(viewWithAlpha)
        viewWithAlpha.translatesAutoresizingMaskIntoConstraints = false
        viewWithAlpha.backgroundColor = .systemGray2
        viewWithAlpha.alpha = 0.7
        viewWithAlpha.clipsToBounds = true
        viewWithAlpha.layer.cornerRadius = 10
        
        
        contentView.addSubview(emailLabel)
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        emailLabel.baseFont()
        emailLabel.baseTextColor()
        emailLabel.baseColor()
        emailLabel.backgroundColor = .clear
        
        
        contentView.addSubview(emailTextField)
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.baseFont()
        emailTextField.baseTextColor()
        emailTextField.baseColor()
        emailTextField.backgroundColor = .clear
        
        
        contentView.addSubview(pwdLabel)
        pwdLabel.translatesAutoresizingMaskIntoConstraints = false
        pwdLabel.baseFont()
        pwdLabel.baseTextColor()
        pwdLabel.baseColor()
        pwdLabel.backgroundColor = .clear
        
        
        contentView.addSubview(registerButton)
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        registerButton.baseColor()
        registerButton.backgroundColor = .clear
    }
}
