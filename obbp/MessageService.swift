//
//  MessageService.swift
//  obbp
//
//  Created by su on 02/04/16.
//  Copyright © 2016 arrC. All rights reserved.
//

import Foundation

class MessageService {
    
    func fetchMessages(callback: (messages: [Message]?, error: String?) -> Void) {
        var messages: [Message] = [Message]()
        
        NetworkManager.shared.request(.GET, endpoint: "/api/messages", params: nil, debug: false) { (result, error) -> Void in
            guard let data = result!["data"] as? NSArray else {
                callback(messages: nil, error: "Got poorly formated response from server.")
                return
            }
            
            for messageData in data {
                var message = Message()
                let sender = messageData["sender"] as? NSDictionary
                
                message.id = messageData["_id"] as? String
                message.message = messageData["message"] as? String
                message.date = messageData["created"] as? NSDate
                message.sender = sender!["fullName"] as? String
                messages.append(message)
            }
            
            callback(messages: messages, error: nil)

        }
    }
    
    func deleteMessage(messageId: String, callback: (success: Bool?, error: String?) -> Void) {
        NetworkManager.shared.request(.DELETE, endpoint: "/api/message/\(messageId)", params: nil, debug: true) { (result, error) -> Void in
            guard error == nil else {
                callback(success: false, error: error)
                return
            }
            
            callback(success: true, error: nil)
        }
    }
}