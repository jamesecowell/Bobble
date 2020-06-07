//
//  Utilities.swift
//  bobble-ios
//
//  Created by James Cowell on 25/05/2020.
//  Copyright © 2020 James Cowell. All rights reserved.
//

import Foundation

class Utilities {
    
    static func isPasswordValid(_ password: String) -> Bool {
        
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: password)
    }
}
