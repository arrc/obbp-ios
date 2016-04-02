//
//  Session.swift
//  obbp
//
//  Created by su on 13/02/16.
//  Copyright © 2016 arrC. All rights reserved.
//

import Foundation
import Locksmith
import Alamofire

class Session {
    let session = Locksmith.loadDataForUserAccount("userSession")
    var token: String?
    var user: NSDictionary?
    
    //  GET SESSION DATA
    func getSessionData() -> (token: String, user: NSDictionary)? {
        guard let token = self.session?["token"] as? String else {
            print("Token not present.")
            return (nil)
        }
        
        guard let user = self.session?["user"] as? NSDictionary else {
            print("User not present.")
            return (nil)
        }
        
        return(token, user)
    }
    
    //  SET SESSION DATA
    func setSessionData() {
        guard let token = self.session?["token"] as? String else {
            print("Token not present.")
            return
        }
        
        guard let user = self.session?["user"] as? NSDictionary else {
            print("User not present.")
            return
        }
        
        self.token = token
        self.user = user
    }
    
    //  GET HEADER
    func getHeader() -> [String: String] {
        return ["Authorization": "Bearer \(session!["token"]!)"]
    }
    
    static let sharedInstance = Session() // http://krakendev.io/blog/the-right-way-to-write-a-singleton
    private init(){} //This prevents others from using the default '()' initializer for this class.
}