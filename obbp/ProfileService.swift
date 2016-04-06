//
//  ProfileService.swift
//  obbp
//
//  Created by su on 02/04/16.
//  Copyright © 2016 arrC. All rights reserved.
//

import Foundation

class ProfileService {
    
    func updateProfile(payload: [String: AnyObject], callback: (user: User?, error: String? ) -> Void) {
        NetworkManager.shared.request(.PUT, endpoint: "/api/profile", params: payload, debug: true) { (result, error) -> Void in
            guard error == nil else {
                callback(user: nil, error: "Error: \(error!)")
                return
            }
            
            guard let data = result!["data"] as? NSDictionary else {
                callback(user: nil, error: "Got poorly formated data from server.")
                return
            }
            
            var user: User = User()
            
            user.address = data["address"] as? String
            user.state = data["state"] as? String
            
            
            callback(user: user, error: nil)
        }
    }
}