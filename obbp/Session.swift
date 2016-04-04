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
    func getSessionData() -> (token: String, user: User)? {
        guard let token = self.session?["token"] as? String else {
            print("Token not present.")
            return (nil)
        }
        
        guard let userDict = self.session?["user"] as? NSDictionary else {
            print("User not present.")
            return (nil)
        }
        
        var user : User = User()
        user.id = userDict["_id"] as? String
        user.username = userDict["username"] as? String
        user.firstName = userDict["firstName"] as? String
        user.lastName = userDict["lastName"] as? String
        user.fullName = userDict["fullName"] as? String
        user.address = userDict["address"] as? String
        user.bloodGroup = userDict["bloodGroup"] as? String
        user.dateOfBirth = userDict["dateOfBirth"] as? String
        user.email = userDict["email"] as? String
        user.gender = userDict["gender"] as? String
        user.mobile = userDict["mobile"] as? Int
        user.pincode = userDict["pincode"] as? Int
        user.state = userDict["state"] as? String
        user.weight = userDict["weight"] as? Int
        
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