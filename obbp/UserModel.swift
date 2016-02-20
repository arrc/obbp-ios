//
//  UserModel.swift
//  obbp
//
//  Created by su on 18/02/16.
//  Copyright © 2016 arrC. All rights reserved.
//

import Foundation

//class Users {
//    var allUsers: [User] = [] {
//        didSet {
//            print("users did set", allUsers)
//        }
//    }
//}

class User {
    var id: String?
    var fullName: String?
    var firstName: String?
    var lastName: String?
    var username: String?
    var password: String?
    var email: String?
    var gender: String?
    var dateOfBirth: String?
    var weight: Int?
    var address: String?
    var pincode: Int?
    var mobile: Int?
    var state: String?
    var bloodGroup: String?
    
    func params() -> [String: AnyObject] {
        var data = [String: AnyObject]()
        
        
        if let firstName = self.firstName {
            data["firstName"] = firstName
        }

        if let lastName = self.lastName {
            data["lastName"] = lastName
        }

        if let username = self.username {
            data["username"] = username
        }

        if let password = self.password {
            data["password"] = password
        }

        if let email = self.email {
            data["email"] = email
        }

        if let gender = self.gender {
            data["gender"] = gender
        }

        if let dateOfBirth = self.dateOfBirth {
            data["dateOfBirth"] = dateOfBirth
        }

        if let weight = self.weight {
            data["weight"] = weight
        }

        if let address = self.address {
            data["address"] = address
        }

        if let pincode = self.pincode {
            data["pincode"] = pincode
        }

        if let mobile = self.mobile {
            data["mobile"] = mobile
        }

        if let state = self.state {
            data["state"] = state
        }

        if let bloodGroup = self.bloodGroup {
            data["bloodGroup"] = bloodGroup
        }

        return data
    }
}