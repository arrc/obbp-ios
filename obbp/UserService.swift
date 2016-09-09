//
//  UserService.swift
//  obbp
//
//  Created by su on 01/04/16.
//  Copyright © 2016 arrC. All rights reserved.
//

import Foundation
import Alamofire
import Locksmith

let userService = UserService() // Kind of a singleton !!!

class UserService {
    
    //  IS LOGGED IN
    func isLoggedIn() -> Bool {
        if (Session.sharedInstance.session?["token"] == nil){
            return false
        }
        return true
    }
    
    //  LOGIN
    func login(credentials : [String: String], completion: () -> Void) {
        Alamofire.request(.POST, "http://obbp.arrc.in/login", parameters: credentials).responseJSON { response in
            print(response)
            if let JSON = response.result.value {
                let token = JSON["token"] as! String
                let user = JSON["user"] as! NSDictionary
                
                do {
                    try Locksmith.saveData(["token" : token, "user" : user], forUserAccount: "userSession")
                    Session.sharedInstance.setSessionData()
                    completion()
                } catch {
                    print("Error \(error)")
                }
            }
        }
    }
    
    //  LOGOUT
    func logout(completion: (result: Bool) -> Void) {
        do {
            try Locksmith.deleteDataForUserAccount("userSession")
            completion(result: true)
        } catch {
            completion(result: false)
        }
    }
}

