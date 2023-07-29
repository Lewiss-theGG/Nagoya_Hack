//
//  ChatViewController.swift
//  GeekWhat2Do
//
//  Created by gkin on 2023/07/26.
//

import UIKit


let apiKey = "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"


let orgId = "org-LhxSkR9pTVukad8pbSLrdN5j"


class ChatViewController: ViewWithAnimationViewController {
    
    
    let msgField = UITextField()
    
    
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
        msgField.borderStyle = .bezel
        msgField.frame = CGRect(x: view.width/12, y: 150, width: view.width*5/6, height: 50)
        msgField.text = response
        
        
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
        else{
            
            print("###############################################")
        }
    }
}



extension ChatViewController{
    
    //private func task1() async -> String {
    private func request() async throws -> ChatGPTResponse{
        
        
        guard let content = msgField.text else{
            
            throw NSError(domain: "Empty Content", code: -1)
        }
        
        
        var requestBody:Data?{
            
            let message = ChatGPTMassage(role: "assistant", content: content)

            
            chatRecord.append(message)
            
            
            let req = ChatGPTRequest(model: "gpt-3.5-turbo", messages: chatRecord)
            return try? JSONEncoder().encode(req)
        }
        
        
        //URL
        guard let url = URL(string: "https://api.openai.com/v1/chat/completions") else {
            throw NSError(domain: "URL error", code: -1)
        }
        
        
        //URLRequestを作成
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.allHTTPHeaderFields = ["Authorization" : "Bearer \(apiKey)"
                                          ,"OpenAI-Organization": orgId
                                          ,"Content-Type" : "application/json"]
        
        
        urlRequest.httpBody = requestBody
        
        
        //URLSessionでRequest
        guard let (data, urlResponse) = try? await URLSession.shared.data(for: urlRequest) else {
            throw NSError(domain: "URLSession error", code: -1)
        }
        
        
        //ResponseをHTTPURLResponseにしてHTTPレスポンスヘッダを得る
        guard let httpStatus = urlResponse as? HTTPURLResponse else {
            throw NSError(domain: "HTTPURLResponse error", code: -1)
        }
        
        
        //BodyをStringに、失敗したらレスポンスコードを返す
        guard let response = String(data: data, encoding: .utf8) else {
            throw NSError(domain: "\(httpStatus.statusCode)", code: -1)
        }
        print(response)
        
        
        //JSONをChatGPTResponse構造体にする
        guard let chatGPTResponse = try? JSONDecoder().decode(ChatGPTResponse.self, from: data) else {
            throw NSError(domain: response, code: -1)
        }
        
        
        previousQuestion = content
        
        
        return chatGPTResponse
    }
}
