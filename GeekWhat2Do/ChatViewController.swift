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
    
    
    private var requestBody:Data?{
        
        let message = ChatGPTMassage(role: "user", content: content)
        let req = ChatGPTRequest(model: "gpt-3.5-turbo", messages: [message])
        return try? JSONEncoder().encode(req)
    }
    
    
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
    
    
    override func viewWillLayoutSubviews() {
        
        
    }
    
    
    @objc private func APIRequest() {
        
        Task{
            do{
                let chatGptResponse = try await request()
                response = chatGptResponse.choices.first?.message.content ?? "no message"
                responseView.text = response
            }catch{
                let nsError = error as NSError
                response = nsError.domain
            }
        }
        
        
//        Task {
//
//            responseView.text = await task1()
//        }
    }
}



extension ChatViewController{

    
    private func task1() async -> String {
        
        //URL
        guard let url = URL(string: "https://api.openai.com/v1/chat/completions") else {
            return "URL error"
        }
        
        
        guard let content = msgField.text else{
            return String()
        }
        
        
        //URLRequestを作成
        var req = URLRequest(url: url)
        req.httpMethod = "POST"
        req.allHTTPHeaderFields = ["Authorization" : "Bearer \(apiKey)"
                                   ,"OpenAI-Organization": orgId
                                   ,"Content-Type" : "application/json"]
        req.httpBody = """
    {
    "model" : "gpt-3.5-turbo"
    ,"messages": [{"role": "user", "content": "\(content)"}]
    }
    """.data(using: .utf8)
        
        //URLSessionでRequest
        guard let (data, urlResponse) = try? await URLSession.shared.data(for: req) else {
            return "URLSession error"
        }
        
        //ResponseをHTTPURLResponseにしてHTTPレスポンスヘッダを得る
        guard let httpStatus = urlResponse as? HTTPURLResponse else {
            return "HTTPURLResponse error"
        }
        
        //BodyをStringに、失敗したらレスポンスコードを返す
        guard let _response = String(data: data, encoding: .utf8) else {
            return "\(httpStatus.statusCode)"
        }
        print(_response)
        
        
        //response = _response
        
        return _response
    }
    
    //private func task1() async -> String {
    private func request() async throws -> ChatGPTResponse{
        
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
        
        return chatGPTResponse
        
    }
}



struct ChatGPTRequest:Codable{
    
    let model:String
    let messages:[ChatGPTMassage]
}



struct ChatGPTMassage:Codable{
    
    let role:String
    let content:String
}



struct ChatGPTResponse:Codable{
    
    let id:String
    let object:String
    let created:Int
    let model:String
    let usage:ChatGPTUsage
    let choices:[ChatGPTChoices]
}



struct ChatGPTUsage:Codable{
    
    let prompt_tokens:Int
    let completion_tokens:Int
    let total_tokens:Int
}



struct ChatGPTChoices:Codable{
    
    let message:ChatGPTMassage
    let finish_reason:String
    let index:Int
}
