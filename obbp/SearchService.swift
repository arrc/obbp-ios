//
//  SearchService.swift
//  obbp
//
//  Created by su on 02/04/16.
//  Copyright © 2016 arrC. All rights reserved.
//

import Foundation
import Alamofire

class SearchService {
    
    // TODO:- count results, alert if 0.
    func performSearch(query: [String: AnyObject], callback: (users: [User]?, error: String?) -> Void) {
        var users: [User] = [User]()
        
        NetworkManager.shared.request(.GET, endpoint: "/search", params: query, debug: false) { (result, error) -> Void in
            guard let data = result!["data"] as? NSArray else {
                callback(users: nil, error: "Got poorly formated response from server.")
                return
            }
            
            for userData in data {
                var user = User()
                user.id = userData["_id"] as? String
                user.fullName = userData["fullName"] as? String
                user.bloodGroup = userData["bloodGroup"] as? String
                user.state = userData["state"] as? String
                users.append(user)
            }
            
            callback(users: users, error: nil)
        }
    }
    
    func sendMessage(payload: [String: AnyObject], callback: (result: NSDictionary?, error: String? ) -> Void) {
        NetworkManager.shared.request(.POST, endpoint: "/api/message", params: payload, debug: false) { (result, error) -> Void in
            guard error == nil else {
                callback(result: nil, error: "Error: \(error)")
                return
            }
            
            callback(result: result, error: nil)
        }
    }
}