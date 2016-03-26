//
//  Config.swift
//  easyUnit
//
//  Created by Wu on 3/24/16.
//  Copyright © 2016 Jiadong Wu. All rights reserved.
//

import Foundation

class Config {
    static var numberOfDigits = 1;
    
    static var numberOfDigitString : String{
        return "%." + String(numberOfDigits) + "f"
    }
}