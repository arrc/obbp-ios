//
//  CampService.swift
//  obbp
//
//  Created by su on 06/04/16.
//  Copyright © 2016 arrC. All rights reserved.
//

import Foundation

class CampService {
    
    func fetchCamps(callback: (camps: [Camp]?, error: String?) -> Void) {
        NetworkManager.shared.request(.GET, endpoint: "/camps", params: nil, debug: false) { (result, error) -> Void in
            guard error == nil else {
                callback(camps: nil, error: "Error: \(error!)")
                return
            }
            
            guard let data = result!["data"] as? NSArray else {
                callback(camps: nil, error: "Got poorly formated data from server.")
                return
            }
            
            var _camps: [Camp] = [Camp]()
            
            for campData in data {
                var _camp = Camp()
                
                _camp.state = campData["state"] as? String
                _camp.date = campData["Date"] as? NSDate
                _camp.address = campData["address"] as? String
                _camp.description = campData["description"] as? String
                
                
                _camps.append(_camp)
            }
            
            callback(camps: _camps, error: nil)
        } // NetworkManager.
    } // fetchCamps.
}