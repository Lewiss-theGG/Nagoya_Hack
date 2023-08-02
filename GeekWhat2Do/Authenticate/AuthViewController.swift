//
//  AuthViewController.swift
//  GeekWhat2Do
//
//  Created by gkin on 2023/07/23.
//

import UIKit

class AuthViewController: ViewWithAnimationViewController {
    
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
        viewWithAlpha.alpha = 0.25
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
        nameTextField.borderStyle = .roundedRect
        nameTextField.backgroundColor = .clear
        nameTextField.placeholder = "ニックネームを入力して下さい"
        nameTextField.textFieldDone()
        
        
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
        signUpButton.setTitle("ユーザー登録", for: .normal)
        signUpButton.pressAction()
        signUpButton.addTarget(self, action: #selector(jumpToAuth), for: .touchUpInside)
        
        
        NSLayoutConstraint.activate([
            
            backGroundGIFView.topAnchor.constraint(equalTo: view.topAnchor),
            backGroundGIFView.leftAnchor.constraint(equalTo: view.leftAnchor),
            backGroundGIFView.rightAnchor.constraint(equalTo: view.rightAnchor),
            backGroundGIFView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            
            contentView.topAnchor.constraint(equalTo: view.safeTopAnchor, constant: 75),
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
            
            
            signUpButton.bottomAnchor.constraint(equalTo: view.safeBottomAnchor, constant: -20),
            signUpButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            signUpButton.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.8),
            signUpButton.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
}


import FirebaseAuth
import Firebase
import FirebaseStorage


extension AuthViewController{
    
    @objc func jumpToAuth(){
        
        let email = emailTextField.text ?? ""
        let password = pwdTextField.text ?? ""
        let name = nameTextField.text ?? ""
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let self = self else { return }
            if let user = result?.user {
                let req = user.createProfileChangeRequest()
                req.displayName = name
                req.commitChanges() { [weak self] error in
                    guard let self = self else { return }
                    if error == nil {
                        user.sendEmailVerification() { [weak self] error in
                            guard let self = self else { return }
                            if error == nil {
                                // 仮登録完了画面へ遷移する処理
                                self.jumpToMain()
                            }
                            self.showErrorIfNeeded(error)
                        }
                    }
                    self.showErrorIfNeeded(error)
                }
            }
            self.showErrorIfNeeded(error)
        }
    }
    
    
    // User情報をFirebaseFirestoreへ保存する処理
    private func createUserToFirestore(name: String, email: String, profileImageName: String?, uid: String) {
        
        // 保存内容を定義する（辞書型）
        let docData = ["email": email,
                       "userName": name,
                       //"profileImageName": profileImageName,
                       "createdAt": Timestamp()] as [String : Any?]
        
        // FirebaseFirestoreへ保存
        SignUpModel().createUserInfo(uid: uid, docDate: docData as [String : Any])
    }
    
    
    private func showErrorIfNeeded(_ errorOrNil: Error?) {
        // エラーがなければ何もしません
        guard let error = errorOrNil else { return }
        
        let message = errorMessage(of: error) // エラーメッセージを取得
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    
    private func errorMessage(of error: Error) -> String {
        
        var message = "エラーが発生しました"
        
        
        guard let errcd = AuthErrorCode.Code(rawValue: (error as NSError).code) else {
            
            return message
        }
        
        
        switch errcd {
        case .networkError: message = "ネットワークに接続できません"
        case .userNotFound: message = "ユーザが見つかりません"
        case .invalidEmail: message = "不正なメールアドレスです"
        case .emailAlreadyInUse: message = "このメールアドレスは既に使われています"
        case .wrongPassword: message = "入力した認証情報でサインインできません"
        case .userDisabled: message = "このアカウントは無効です"
        case .weakPassword: message = "パスワードが脆弱すぎます"
            // これは一例です。必要に応じて増減させてください
        default: break
        }
        return message
    }
    
    
    private func jumpToMain(){
        
        let vc = TabBarController()
        let nvc = UINavigationController(rootViewController: vc)
        nvc.modalPresentationStyle = .fullScreen
        present(nvc, animated: false) { [self] in
            
            self.createUserToFirestore(name: nameTextField.text!,
                                       email: emailTextField.text!,
                                       profileImageName: String(),
                                       uid: Auth.auth().currentUser!.uid)
        }
    }
}


class mainViewController: UIViewController{
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        setView()
    }
    
    
    func setView(){
        
        view.backgroundColor = .blue
    }
}


//delegateはweak参照したいため、classを継承する
protocol SignUpModelDelegate: AnyObject {
    func createImageToFirestorageAction()
    func createUserToFirestoreAction(fileName: String?)
    func completedRegisterUserInfoAction()
}


class SignUpModel {
    
    // delegateはメモリリークを回避するためweak参照する
    weak var delegate: SignUpModelDelegate?

    func createUser(email: String, password: String) {
        // FirebaseAuthへ保存
        Auth.auth().createUser(withEmail: email, password: password) { (res, err) in
            if let err = err {
                print("FirebaseAuthへの保存に失敗しました。\(err)")
                // ユーザー情報の登録が失敗した時の処理
                return
            }
            print("FirebaseAuthへの保存に成功しました。")
            // FirebaseAuthへ保存完了 -> FirebaseStorageへ保存処理
            self.delegate?.createImageToFirestorageAction()
        }
    }

    func creatrImage(fileName: String, uploadImage: Data) {
        // FirebaseStorageへ保存
        let storageRef = Storage.storage().reference().child("profile_image").child(fileName)
        storageRef.putData(uploadImage, metadata: nil) { (metadate, err) in
            if let err = err {
                print("Firestorageへの保存に失敗しました。\(err)")
                // ユーザー情報の登録が失敗した時の処理
                return
            }
            print("Firestorageへの保存に成功しました。")
            // FirebaseStorageへ保存完了 -> FirebaseFirestoreへ保存処理
            self.delegate?.createUserToFirestoreAction(fileName: fileName)
        }
    }

    func createUserInfo(uid: String, docDate: [String : Any]) {
        // FirebaseFirestoreへ保存
        Firestore.firestore().collection("Users").document(uid).setData(docDate as [String : Any]) { (err) in
            if let err = err {
                print("Firestoreへの保存に失敗しました。\(err)")
                // ユーザー情報の登録が失敗した時の処理
                return
            }
            print("Firestoreへの保存に成功しました。")
            // ユーザー情報の登録が完了した時の処理
            self.delegate?.completedRegisterUserInfoAction()
        }
    }

}
