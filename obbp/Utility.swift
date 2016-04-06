//
//  Utility.swift
//  obbp
//
//  Created by su on 04/04/16.
//  Copyright © 2016 arrC. All rights reserved.
//

import Foundation

struct Utility {
    let states = [ "Andhra Pradesh", "Arunachal Pradesh", "Assam", "Bihar",
        "Chhattisgarh", "Chandigarh", "Dadra and Nagar Haveli", "Daman and Diu",
        "Delhi", "Goa", "Gujarat", "Haryana", "Himachal Pradesh", "Jammu and Kashmir",
        "Jharkhand", "Karnataka", "Kerala", "Madhya Pradesh", "Maharashtra", "Manipur",
        "Meghalaya", "Mizoram", "Nagaland", "Orissa", "Punjab", "Pondicherry", "Rajasthan",
        "Sikkim", "Tamil Nadu", "Tripura", "Uttar Pradesh", "Uttarakhand", "West Bengal"
    ]
    
    static let sharedInstance = Utility() // http://krakendev.io/blog/the-right-way-to-write-a-singleton
    private init(){} //This prevents others from using the default '()' initializer for this class.
}