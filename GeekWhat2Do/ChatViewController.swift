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
    
    
    private var response = String()
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        view.backgroundColor = .systemBackground
        
        
        view.addSubview(msgField)
        msgField.backgroundColor = .secondarySystemBackground
        msgField.borderStyle = .bezel
        msgField.frame = CGRect(x: view.width/12, y: 150, width: view.width*5/6, height: 50)
        msgField.text = "おはよう!"
        
        
        view.addSubview(requestButton)
        requestButton.frame = CGRect(x: view.width/3, y: msgField.bottom + 50, width: view.width/3, height: 50)
        requestButton.backgroundColor = .link
        requestButton.setTitle("request", for: .normal)
        requestButton.pressAction()
        //requestButton.addTarget(self, action: #selector(APIRequest), for: .touchUpInside)
        requestButton.addTarget(self, action: #selector(tappedWithAsyncAwaitButton), for: .touchUpInside)
        
        
        view.addSubview(responseView)
        responseView.backgroundColor = .secondarySystemBackground
        responseView.frame = CGRect(x: view.width/12, y: requestButton.bottom + 50, width: view.width*5/6, height: view.safetyHeight - 200)
    }
    
    
    override func viewWillLayoutSubviews() {
        
        
    }
    
    
    @objc func APIRequest() async {
                
        await request {
            
            Task{
                self.responseView.text = self.response
            }
        }
    }
}



extension ChatViewController{
    
    
    private func request(completion: @escaping () -> Void) async {
        
        //URL
        guard let url = URL(string: "https://api.openai.com/v1/chat/completions") else {
            return //"URL error"
        }
        
        
        guard let content = msgField.text else{
            return //String()
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
            return //"URLSession error"
        }
        
        //ResponseをHTTPURLResponseにしてHTTPレスポンスヘッダを得る
        guard let httpStatus = urlResponse as? HTTPURLResponse else {
            return //"HTTPURLResponse error"
        }
        
        //BodyをStringに、失敗したらレスポンスコードを返す
        guard let _response = String(data: data, encoding: .utf8) else {
            return// "\(httpStatus.statusCode)"
        }
        print(_response)
        
        
        response = _response
        
        completion()
        // return response
    }
    
    
    @objc private func tappedWithAsyncAwaitButton() {
        
        print("async/await")
        Task {
            let res = await task1()
            responseView.text = res
        }
    }
    
    
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
}

class ServerTaskWithAsyncAwait {


//    private func task2() async -> Int {
//        sleep(2)
//        print("タスク2完了")
//        return 1
//    }
//
//    func executeBothTask() async -> Int {
//        let num1 = await task1()
//        let num2 = await task2()
//        return num1 + num2
//    }
}
