//
//  NetworkManager.swift
//  obbp
//
//  Created by su on 02/04/16.
//  Copyright © 2016 arrC. All rights reserved.
//

import Foundation
import Alamofire

class NetworkManager {
    private let HOSTNAME = "http://localhost:4000"
    
    func request(method: Alamofire.Method, endpoint: URLStringConvertible, params: [String: AnyObject]?,
        debug: Bool = false,
        callback: (result: NSDictionary?, error: String?) -> Void) {
        
        let url: URLStringConvertible = "\(HOSTNAME)\(endpoint)"
        let parameters: [String: AnyObject]?
            
        if params == nil {
            parameters = nil
        } else {
            parameters = params!
        }
            
        Alamofire.request(method, url, parameters: parameters, headers: Session.sharedInstance.getHeader()).responseJSON { (response) -> Void in
            
            if debug {
                print("=========================================================")
                print("URL: \t", response.request!.URL!)  // original URL request
                print("Data: \n", response)     // server data
                print("Result: \t", response.result)   // result of response serialization
                print("Error: \t", response.result.error)
                print("=========================================================")
            }
            
            guard response.result.isSuccess else {
                let error = response.result.error!
                var errorString: String = ""
                
                if(error.code == -1004) { // Server offline or unreachable.
                    errorString = error.localizedDescription
                }
                
                if(error.code == 3840) { // Wrong endpoint.
                    errorString = "Invalid url. \(error.code)"
                }
                
                callback(result: nil, error: errorString)
                return
            }
            
            guard let JSON = response.result.value as? NSDictionary else {
                callback(result: nil, error: "Got poorly formated response from server.")
                return
            }
            
            callback(result: JSON, error: nil)
        }
    }
    
//    singleton
    static let shared = NetworkManager() // http://krakendev.io/blog/the-right-way-to-write-a-singleton
    private init(){} // This prevents others from using the default '()' initializer for this class.
}