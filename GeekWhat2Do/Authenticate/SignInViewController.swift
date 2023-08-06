//
//  SignInViewController.swift
//  GeekWhat2Do
//
//  Created by gkin on 2023/07/24.
//

import UIKit
import FirebaseAuth


class SignInViewController: ViewWithAnimationViewController {

    override func viewDidLoad() {

        
        super.viewDidLoad()
        setView()
    }


    func setView(){

        view.addSubview(contentView)
        contentView.backgroundColor = .clear
        contentView.layer.cornerRadius = 10
        contentView.clipsToBounds = true
        contentView.translatesAutoresizingMaskIntoConstraints = false


        contentView.addSubview(viewWithAlpha)
        viewWithAlpha.alpha = 0.25
        viewWithAlpha.backgroundColor = .systemGray2
        viewWithAlpha.layer.cornerRadius = 10
        viewWithAlpha.clipsToBounds = true
        viewWithAlpha.translatesAutoresizingMaskIntoConstraints = false


        contentView.addSubview(emailLabel)
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        emailLabel.baseFont(font: .monospacedSystemFont(ofSize: 20, weight: .semibold))
        emailLabel.baseTextColor()
        emailLabel.backgroundColor = .clear
        emailLabel.text = "メールアドレス"


        contentView.addSubview(emailTextField)
        emailTextField.baseFont()
        emailTextField.baseTextColor()
        emailTextField.borderStyle = .roundedRect
        emailTextField.backgroundColor = .clear
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.placeholder = "メールアドレスを入力して下さい"
        emailTextField.textFieldDone()


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
        pwdTextField.borderStyle = .roundedRect
        pwdTextField.backgroundColor = .clear
        pwdTextField.placeholder = "パスワードを入力して下さい"
        pwdTextField.textFieldDone()


        view.addSubview(signUpButton)
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.backgroundColor = .clear
        signUpButton.clipsToBounds = true
        signUpButton.layer.cornerRadius = 20
        signUpButton.backgroundColor = .link
        signUpButton.setTitle("ログイン", for: .normal)
        signUpButton.pressAction()
        signUpButton.addTarget(self, action: #selector(didTapSignInButton), for: .touchUpInside)
        
        
        view.addSubview(forgotPwd)
        forgotPwd.translatesAutoresizingMaskIntoConstraints = false
        forgotPwd.backgroundColor = .clear
        forgotPwd.clipsToBounds = true
        forgotPwd.layer.cornerRadius = 20
        forgotPwd.backgroundColor = .clear
        forgotPwd.setTitleColor(.link, for: .normal)
        forgotPwd.setTitle("パスワードを忘れた", for: .normal)
        forgotPwd.pressAction()
        forgotPwd.addTarget(self, action: #selector(didTapSignInButton), for: .touchUpInside)



        NSLayoutConstraint.activate([

            contentView.topAnchor.constraint(equalTo: view.safeTopAnchor, constant: 75),
            contentView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            contentView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            contentView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.27),


            viewWithAlpha.topAnchor.constraint(equalTo: contentView.topAnchor),
            viewWithAlpha.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            viewWithAlpha.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            viewWithAlpha.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            

            emailLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            emailLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            emailLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.9),
            emailLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 1/4, constant: -10),


            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor),
            emailTextField.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            emailTextField.widthAnchor.constraint(equalTo: emailLabel.widthAnchor),
            emailTextField.heightAnchor.constraint(equalTo: emailLabel.heightAnchor),


            pwdLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor),
            pwdLabel.centerXAnchor.constraint(equalTo: emailLabel.centerXAnchor),
            pwdLabel.widthAnchor.constraint(equalTo: emailLabel.widthAnchor),
            pwdLabel.heightAnchor.constraint(equalTo: emailLabel.heightAnchor),


            pwdTextField.topAnchor.constraint(equalTo: pwdLabel.bottomAnchor),
            pwdTextField.centerXAnchor.constraint(equalTo: emailLabel.centerXAnchor),
            pwdTextField.widthAnchor.constraint(equalTo: emailLabel.widthAnchor),
            pwdTextField.heightAnchor.constraint(equalTo: emailLabel.heightAnchor),


            forgotPwd.bottomAnchor.constraint(equalTo: view.safeBottomAnchor, constant: -20),
            forgotPwd.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            forgotPwd.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.8),
            forgotPwd.heightAnchor.constraint(equalToConstant: 40),
            
            signUpButton.bottomAnchor.constraint(equalTo: forgotPwd.topAnchor, constant: -20),
            signUpButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            signUpButton.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.8),
            signUpButton.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    
    
    @objc private func didTapSignInButton() {
        
        let email = emailTextField.text ?? ""
        let password = pwdTextField.text ?? ""
        
        
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] result, error in
            
            guard let self = self else { return }
            
            if let user = result?.user {
                
                // whatever comes after verification
            }
            
            self.showErrorIfNeeded(error)
        }
    }
    
    
    private func showErrorIfNeeded(_ errorOrNil: Error?) {
        // エラーがなければ何もしません
        guard let _ = errorOrNil else { return }
        
        let message = "エラーが起きました" // ここは後述しますが、とりあえず固定文字列
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
