//
//  Category.swift
//  easyUnit
//
//  Created by Wu on 3/25/16.
//  Copyright © 2016 Jiadong Wu. All rights reserved.
//

import Foundation

enum Category : Int {
    case DEFAULT = 0
    case WEIGHT, LENGTH, VOLUME, TEMPERATURE
}

enum Country: Int {
    case DEFAULT = 0
    case CN, US, UK
    func getString() -> String {
        switch self {
        case .CN:
            return "CN"
        case .UK:
            return "UK"
        case .US:
            return "US"
        default:
            return ""
        }
    }
}