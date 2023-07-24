//
//  ViewController.swift
//  GeekWhat2Do
//
//  Created by gkin on 2023/07/23.
//

import UIKit


class ViewWithAnimationViewController: UIViewController {
    
    let backGroundGIFView = UIImageView()
    
    
    let contentView = UIView()


    let viewWithAlpha = UIView()
    
    
    let nameLabel = UILabel()


    let nameTextField = UITextField()


    let emailLabel = UILabel()


    let emailTextField = UITextField()


    let pwdLabel = UILabel()


    let pwdTextField = UITextField()


    let signUpButton = UIButton()
    
    
    let forgotPwd = UIButton()
    

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        view.addSubview(backGroundGIFView)
        backGroundGIFView.backgroundColor = .systemBackground
        backGroundGIFView.frame = view.frame
    }
}

