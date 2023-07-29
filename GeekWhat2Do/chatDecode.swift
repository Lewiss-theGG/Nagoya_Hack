//
//  chatDecode.swift
//  GeekWhat2Do
//
//  Created by gkin on 2023/07/29.
//

import Foundation


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
