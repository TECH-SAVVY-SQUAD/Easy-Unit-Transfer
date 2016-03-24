//
//  Unit.swift
//  easyUnit
//
//  Created by Wu on 3/19/16.
//  Copyright © 2016 Jiadong Wu. All rights reserved.
//

import Foundation

class Unit {
    private(set) var symbol: String
    private(set) var name: String = ""
    private(set) var description: String
    
    // weight 1
    // length 2
    // volume 3
    // temperature 4
    // shoes 5
    private(set) var category: Int
    private(set) var from: (Double)-> Double
    private(set) var to: (Double)-> Double
    private(set) var country: String
    
    init(symbol: String, name: String,category: Int, description: String = "", from: (Double)->Double, to: (Double)->Double, country: String) {
        self.symbol = symbol
        self.category = category
        self.description = description
        self.from = from
        self.to = to
        self.country = country
    }
    
    init(symbol: String, category: Int, description: String) {
        self.symbol = symbol
        self.category = category
        self.description = description
        self.country = ""
        self.from = {$0}
        self.to = {$0}
    }

}