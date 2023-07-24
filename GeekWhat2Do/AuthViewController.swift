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
    
    
    let viewWithAlpha = UIView()
    
    
    let nameLabel = UILabel()
    
    
    let nameTextField = UITextField()
    
    
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
        backGroundGIFView.backgroundColor = .systemBackground
        backGroundGIFView.frame = view.frame
        
        
        view.addSubview(contentView)
        contentView.backgroundColor = .clear
        contentView.layer.cornerRadius = 10
        contentView.clipsToBounds = true
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        
        contentView.addSubview(viewWithAlpha)
        viewWithAlpha.alpha = 0.7
        viewWithAlpha.backgroundColor = .systemGray2
        viewWithAlpha.layer.cornerRadius = 10
        viewWithAlpha.clipsToBounds = true
        viewWithAlpha.translatesAutoresizingMaskIntoConstraints = false
        
        
        contentView.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.baseFont(font: .monospacedSystemFont(ofSize: 20, weight: .semibold))
        nameLabel.baseTextColor()
        nameLabel.backgroundColor = .clear
        nameLabel.text = "ニックネーム"
        
        
        contentView.addSubview(nameTextField)
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.baseTextColor()
        nameTextField.borderStyle = .bezel
        nameTextField.backgroundColor = .systemGray2
        nameTextField.placeholder = "ニックネームを入力して下さい"
        
        
        contentView.addSubview(emailLabel)
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        emailLabel.baseFont(font: .monospacedSystemFont(ofSize: 20, weight: .semibold))
        emailLabel.baseTextColor()
        emailLabel.backgroundColor = .clear
        emailLabel.text = "メールアドレス"
        
        
        contentView.addSubview(emailTextField)
        emailTextField.baseFont()
        emailTextField.baseTextColor()
        emailTextField.borderStyle = .bezel
        emailTextField.backgroundColor = .systemGray2
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.placeholder = "メールアドレスを入力して下さい"
        
        
        contentView.addSubview(pwdLabel)
        pwdLabel.translatesAutoresizingMaskIntoConstraints = false
        pwdLabel.baseFont(font: .monospacedSystemFont(ofSize: 20, weight: .semibold))
        pwdLabel.baseTextColor()
        pwdLabel.backgroundColor = .clear
        pwdLabel.text = "パスワード"
        
        
        contentView.addSubview(pwdTextField)
        pwdTextField.translatesAutoresizingMaskIntoConstraints = false
        pwdTextField.baseFont()
        pwdTextField.baseTextColor()
        pwdTextField.borderStyle = .bezel
        pwdTextField.backgroundColor = .systemGray2
        pwdTextField.placeholder = "パスワードを入力して下さい"
        
        
        view.addSubview(registerButton)
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        registerButton.backgroundColor = .clear
        registerButton.clipsToBounds = true
        registerButton.layer.cornerRadius = 20
        registerButton.backgroundColor = .link
        registerButton.setTitle("ユーザー登録", for: .normal)
        registerButton.pressAction()
        
        
        NSLayoutConstraint.activate([
            
            backGroundGIFView.topAnchor.constraint(equalTo: view.topAnchor),
            backGroundGIFView.leftAnchor.constraint(equalTo: view.leftAnchor),
            backGroundGIFView.rightAnchor.constraint(equalTo: view.rightAnchor),
            backGroundGIFView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            
            contentView.topAnchor.constraint(equalTo: view.safeTopAnchor, constant: 100),
            contentView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            contentView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            contentView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4),
            
            
            viewWithAlpha.topAnchor.constraint(equalTo: contentView.topAnchor),
            viewWithAlpha.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            viewWithAlpha.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            viewWithAlpha.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            nameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            nameLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.9),
            nameLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 1/6, constant: -5),
            
            
            nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            nameTextField.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            nameTextField.widthAnchor.constraint(equalTo: nameLabel.widthAnchor),
            nameTextField.heightAnchor.constraint(equalTo: nameLabel.heightAnchor),
            
            
            emailLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor),
            emailLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            emailLabel.widthAnchor.constraint(equalTo: nameLabel.widthAnchor),
            emailLabel.heightAnchor.constraint(equalTo: nameLabel.heightAnchor),
            
            
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor),
            emailTextField.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            emailTextField.widthAnchor.constraint(equalTo: nameLabel.widthAnchor),
            emailTextField.heightAnchor.constraint(equalTo: nameLabel.heightAnchor),
            
            
            pwdLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor),
            pwdLabel.centerXAnchor.constraint(equalTo: nameLabel.centerXAnchor),
            pwdLabel.widthAnchor.constraint(equalTo: nameLabel.widthAnchor),
            pwdLabel.heightAnchor.constraint(equalTo: nameLabel.heightAnchor),


            pwdTextField.topAnchor.constraint(equalTo: pwdLabel.bottomAnchor),
            pwdTextField.centerXAnchor.constraint(equalTo: nameLabel.centerXAnchor),
            pwdTextField.widthAnchor.constraint(equalTo: nameLabel.widthAnchor),
            pwdTextField.heightAnchor.constraint(equalTo: nameLabel.heightAnchor),
            
            
            registerButton.topAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 20),
            registerButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            registerButton.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.8),
            registerButton.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
}


