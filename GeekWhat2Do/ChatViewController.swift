//
//  ChatViewController.swift
//  GeekWhat2Do
//
//  Created by gkin on 2023/07/26.
//

import UIKit
import KMPlaceholderTextView


let apiKey = "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"


let orgId = "org-LhxSkR9pTVukad8pbSLrdN5j"


final class ChatViewController: UIViewController {
    
    
    let textviewContainer = UIView()
    
    
    let msgField = KMPlaceholderTextView()
    
    
    //let msgField = UITextField()
    
    
    let requestButton = UIButton()
    
    
    let responseView = UITextView()
    
    
    var response = String()
    
    
    var content = String()
    
    
    var waitForResponse = false
    
    
    var previousQuestion = String()
    
    
    var chatRecord: [ChatGPTMassage] = []
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        view.backgroundColor = .systemBackground
        
        
        view.addSubview(msgField)
        msgField.backgroundColor = .secondarySystemBackground
        msgField.text = response
        
        
        view.addSubview(requestButton)
        requestButton.backgroundColor = .link
        requestButton.setTitle("request", for: .normal)
        requestButton.pressAction()
        requestButton.addTarget(self, action: #selector(APIRequest), for: .touchUpInside)
        
        
        view.addSubview(responseView)
        responseView.backgroundColor = .secondarySystemBackground
        responseView.frame = CGRect(x: view.width/12, y: requestButton.bottom + 50, width: view.width*5/6, height: view.safetyHeight - 200)
        
        
        print(content)
    }
    
    
    @objc private func APIRequest() {
        
        if waitForResponse == false{
            
            waitForResponse = true
            
            
            Task{
                do{
                    
                    let chatGptResponse = try await request()
                    
                    
                    response = chatGptResponse.choices.first?.message.content ?? "no message"
                    responseView.text = response
                    
                    
                    msgField.text = ""
                    msgField.placeholder = previousQuestion
                    
                    
                    waitForResponse = false
                }catch{
                    
                    let nsError = error as NSError
                    response = nsError.domain
                    
                    
                    waitForResponse = false
                }
            }
        }
    }
}
