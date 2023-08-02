//
//  ChatView_Chat.swift
//  GeekWhat2Do
//
//  Created by gkin on 2023/07/29.
//

import Foundation



//extension ChatViewController{
//    
//    //private func task1() async -> String {
//    func request() async throws -> ChatGPTResponse{
//        
//        
//        guard let content = msgField.text else{
//            
//            throw NSError(domain: "Empty Content", code: -1)
//        }
//        
//        
//        var requestBody:Data?{
//            
//            let message = ChatGPTMassage(role: "assistant", content: content)
//
//            
//            chatRecord.append(message)
//            
//            
//            let req = ChatGPTRequest(model: "gpt-3.5-turbo", messages: chatRecord)
//            return try? JSONEncoder().encode(req)
//        }
//        
//        
//        //URL
//        guard let url = URL(string: "https://api.openai.com/v1/chat/completions") else {
//            throw NSError(domain: "URL error", code: -1)
//        }
//        
//        
//        //URLRequestを作成
//        var urlRequest = URLRequest(url: url)
//        urlRequest.httpMethod = "POST"
//        urlRequest.allHTTPHeaderFields = ["Authorization" : "Bearer \(apiKey)"
//                                          ,"OpenAI-Organization": orgId
//                                          ,"Content-Type" : "application/json"]
//        
//        
//        urlRequest.httpBody = requestBody
//        
//        
//        //URLSessionでRequest
//        guard let (data, urlResponse) = try? await URLSession.shared.data(for: urlRequest) else {
//            throw NSError(domain: "URLSession error", code: -1)
//        }
//        
//        
//        //ResponseをHTTPURLResponseにしてHTTPレスポンスヘッダを得る
//        guard let httpStatus = urlResponse as? HTTPURLResponse else {
//            throw NSError(domain: "HTTPURLResponse error", code: -1)
//        }
//        
//        
//        //BodyをStringに、失敗したらレスポンスコードを返す
//        guard let response = String(data: data, encoding: .utf8) else {
//            throw NSError(domain: "\(httpStatus.statusCode)", code: -1)
//        }
//        print(response)
//        
//        
//        //JSONをChatGPTResponse構造体にする
//        guard let chatGPTResponse = try? JSONDecoder().decode(ChatGPTResponse.self, from: data) else {
//            throw NSError(domain: response, code: -1)
//        }
//        
//        
//        previousQuestion = content
//        
//        
//        return chatGPTResponse
//    }
//}

