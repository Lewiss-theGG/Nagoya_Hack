//
//  AuthViewController.swift
//  GeekWhat2Do
//
//  Created by gkin on 2023/07/23.
//

import UIKit

class AuthViewController: UIViewController {
    
    let backGroundGIFView = UIImageView()
    
    
    let contentView = UIView()
    
    
    let userImgButton = UIButton()
    
    
    let emailLabel = UILabel()
    
    
    let emailTextField = UITextField()
    
    
    let pwdLabel = UILabel()
    
    
    let pwdTextField = UITextField()
    

    override func viewDidLoad() {
        
        super.viewDidLoad()
        

        view.addSubview(backGroundGIFView)
        backGroundGIFView.frame = CGRect(x: view.left, y: view.top, width: view.width, height: view.height)
        backGroundGIFView.backgroundColor = .clear
        
        
        view.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = .blue
        contentView.alpha = 0.7
        contentView.clipsToBounds = true
        contentView.layer.cornerRadius = 10
        
        
        view.addSubview(userImgButton)
        userImgButton.translatesAutoresizingMaskIntoConstraints = false
        userImgButton.baseColor()
        userImgButton.backgroundColor = .clear
        
        
        view.addSubview(emailLabel)
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        emailLabel.baseFont()
        emailLabel.baseTextColor()
        emailLabel.baseColor()
        emailLabel.backgroundColor = .clear
        
        
        view.addSubview(emailTextField)
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.baseFont()
        emailTextField.baseTextColor()
        emailTextField.baseColor()
        emailTextField.backgroundColor = .clear
        
        
        view.addSubview(pwdLabel)
        pwdLabel.translatesAutoresizingMaskIntoConstraints = false
        pwdLabel.baseFont()
        pwdLabel.baseTextColor()
        pwdLabel.baseColor()
        pwdLabel.backgroundColor = .clear
    }
}
