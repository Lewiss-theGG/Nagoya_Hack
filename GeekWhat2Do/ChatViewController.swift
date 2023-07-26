//
//  ChatViewController.swift
//  GeekWhat2Do
//
//  Created by gkin on 2023/07/26.
//

import UIKit


class ChatViewController: UIViewController {
    
    let apiKey = "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"
    
    
    let orgId = "org-LhxSkR9pTVukad8pbSLrdN5j"
    
    
    let msgField = UITextField()
    
    
    let requestButton = UIButton()
    
    
    let responseView = UITextView()
    
    
    var response = String()
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        view.backgroundColor = .systemBackground
        
        
        view.addSubview(msgField)
        msgField.backgroundColor = .secondarySystemBackground
        msgField.borderStyle = .bezel
        msgField.frame = CGRect(x: view.width/12, y: 150, width: view.width*5/6, height: 50)
        msgField.text = "hello!"
        
        
        view.addSubview(requestButton)
        requestButton.frame = CGRect(x: view.width/3, y: msgField.bottom + 50, width: view.width/3, height: 50)
        requestButton.backgroundColor = .link
        requestButton.setTitle("request", for: .normal)
        requestButton.pressAction()
        requestButton.addTarget(self, action: #selector(APIRequest), for: .touchUpInside)
        
        
        view.addSubview(responseView)
        responseView.backgroundColor = .secondarySystemBackground
        responseView.frame = CGRect(x: view.width/12, y: requestButton.bottom + 50, width: view.width*5/6, height: view.safetyHeight - 200)
    }
    
    
    override func viewWillLayoutSubviews() {
        
        
    }
    
    
    @objc func APIRequest() {
        
        
    }
}
