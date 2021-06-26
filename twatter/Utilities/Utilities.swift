//
//  Utilities.swift
//  twatter
//
//  Created by Abba on 25/06/2021.
//

import Foundation

class Utilities {
    
    static func isPasswordValid(_ password : String) -> Bool{
        
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z//d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: password)
    }
    
    static let twatterViewController = "TwatterVC"
}
