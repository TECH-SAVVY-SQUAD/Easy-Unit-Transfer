//
//  Country.swift
//  easyUnit
//
//  Created by Wu on 6/13/16.
//  Copyright © 2016 Jiadong Wu. All rights reserved.
//

import Foundation

enum Country: Int {
    case CN = 0
    case US, UK
    func getString() -> String {
        switch self {
        case .CN:
            return "CN"
        case .UK:
            return "UK"
        case .US:
            return "US"
        }
    }
}