//
//  ChatViewController.swift
//  GeekWhat2Do
//
//  Created by gkin on 2023/07/26.
//

import UIKit
import Firebase
import FirebaseFirestoreSwift
import KMPlaceholderTextView
import AVFoundation


let apiKey = "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"


let orgId = "org-LhxSkR9pTVukad8pbSLrdN5j"


final class ChatViewController: UIViewController {
    
    let backGroundGIFView = UIView()
    
    
    let responseView = UITextView()
    
    
    var chatResponse = String()
    
    
    var waitForResponse = false
    
    
    var chatRecord: [ChatGPTMassage] = []
    
    
    var targetYear = Int()
    
    
    var targetMonth = Int()
    
    
    var targetValue = String()
    
    
    var response = Response(todo: [], detail: [], map: [])

    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        
        view.addSubview(backGroundGIFView)
        backGroundGIFView.frame = view.frame
        
        
        setView()
        APIRequest()
        setLeft()
        playVideo()
    }
    
    
    func playVideo() {
        
        guard let path = Bundle.main.path(forResource: "backvid", ofType: "mp4") else {
            print("Error: Video file not found")
            return
        }
        
        
        let player = AVPlayer (url: URL(fileURLWithPath: path))
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = self.view.bounds
        playerLayer.videoGravity = .resizeAspectFill

        self.backGroundGIFView.layer.addSublayer(playerLayer)
        
        player.play()
    }
    
    func setView(){
        
        view.addSubview(responseView)
        responseView.baseColor(opacity: 0.25)
        responseView.baseFont()
        responseView.baseTextColor()
        responseView.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            
            responseView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            responseView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            responseView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            responseView.heightAnchor.constraint(equalTo: view.safeHeightAnchor, multiplier: 0.5),
        ])
    }
    
    
    @objc private func APIRequest() {
        
        if waitForResponse == false{
            
            waitForResponse = true
            
            
            Task{
                do{
                    
                    let chatGptResponse = try await request()
                    
                    
                    chatResponse = chatGptResponse.choices.first?.message.content ?? "no message"
                    responseView.text = chatResponse
                    
                    
                    var checker = 0
                    for i in chatResponse.components(separatedBy: "\n"){
                        
                        if i.contains("やるべき事"){
                            
                            continue
                        }
                        
                        if i.contains("具体的なアドバイス"){
                            
                            checker += 1
                            continue
                        }
                        
                        if i.contains("ロードマップ"){
                            
                            checker += 1
                            continue
                        }
                        
                        let del: Set<Character> = [" ", "-"] // 削除する文字を指定
                         
                        // 文字列から "c" を削除
                        var l = i
                        l.removeAll(where: { del.contains($0)})
                        
                        
                        if l == ""{
                            
                            continue
                        }
                        
                        switch checker {
                            
                        case 0:
                            
                            response.todo.append(l)
                        case 1:
                            
                            response.detail.append(l)
                        case 2:
                            
                            response.map.append(l)
                            
                        default:
                            break
                        }
                    }
                    
                    
                    let saveData: Record = Record(whatToBe: targetValue, declaredAt: Date(), period_Y: targetYear, period_M: targetMonth, response: response)
                    
                    
                    do {

                        try chatData().putData(request: saveData)
                    }
                    catch{

                        print(error)
                    }
                    
                    
                }catch{
                    
                    let nsError = error as NSError
                    print(nsError.domain)
                    
                    
                    waitForResponse = false
                }
            }
        }
    }
}



extension ChatViewController{
    
    //private func task1() async -> String {
    func request() async throws -> ChatGPTResponse{
        
        var requestBody:Data?{
            
            let message = ChatGPTMassage(role: "assistant", content: "以下のテキストに対して、物知りの占い師が22歳の人にアドバイスする様に答えて下さい。まず、やるべき事を出力し、それぞれについて具体的なアドバイスをして下さい。最後に具体的なロードマップを作成して下さい。但し、具体的なアドバイスは箇条書きでお願いします。\n\n希望する形式：\nやるべき事：\n具体的なアドバイス:\nロードマップ：\n\nテキスト：\(targetYear)年\(targetMonth)ヶ月で\(targetValue)になりたい。")

            
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
        urlRequest.allHTTPHeaderFields = ["Authorization" : "Bearer \(apiKey)",
                                          "OpenAI-Organization": orgId,
                                          "Content-Type" : "application/json"]
        
        
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
        //print(response) // will print the whole json response
        
        
        //JSONをChatGPTResponse構造体にする
        guard let chatGPTResponse = try? JSONDecoder().decode(ChatGPTResponse.self, from: data) else {
            throw NSError(domain: response, code: -1)
        }
        
        
        return chatGPTResponse
    }
}



extension ChatViewController{
    
    
    
}


class chatData{
    
    @Published var request = [Record]()
    
    
    final func putData(request: Record) throws {
        
        do {
            
            try Database().records.addDocument(from: request)
        }
        catch{
            
            print(error)
        }
    }
    
    
    final func getData() throws{
        
        Database().records.addSnapshotListener { querySnapshot, error in
            
            guard let documents = querySnapshot?.documents else{
                
                print("error?.localizedDescription")
                return
            }
            
            
            self.request = documents.compactMap { (queryDocumentSnapshot) -> Record? in
                
                return try? queryDocumentSnapshot.data(as: Record.self)
            }
        }
    }
}


struct UserInfo: Identifiable, Codable{
    
    @DocumentID var id: String? = UUID().uuidString
    
    
    var createdAt: String
    var email: String
    var userName: Int
    var userImage: String
}


struct Record: Identifiable, Codable{
    
    @DocumentID var id: String? = UUID().uuidString
    
    
    var whatToBe: String
    var declaredAt: Date
    var period_Y: Int
    var period_M: Int
    var response: Response
    
    
    enum CodingKyes: String, CodingKey{
        
        case title
        case author
        case whatToBe = "what2b"
    }
}


struct Response: Codable{
    
    var todo : [String]
    var detail : [String]
    var map : [String]

    
    enum CodingKeys: String, CodingKey {
        case todo = "やるべき事"
        case detail = "具体的なアドバイス"
        case map = "ロードマップ"
    }
}



