//
//  Language.swift
//  easyUnit
//
//  Created by Wu on 6/13/16.
//  Copyright © 2016 Jiadong Wu. All rights reserved.
//

import Foundation

enum Language: Int {
    case EN = 0
    case CN
    func getString() -> String {
        switch self {
        case .CN:
            return "Chinese"
        case .EN:
            return "English"
        }
    }
    func getLocalizableTag() -> String {
        switch self {
        case .CN:
            return "zh-Hans"
        case .EN:
            return "en"
        }
    }
}