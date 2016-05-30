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
    private(set) var name: String
    private(set) var description: String
    private(set) var category: Category
    private(set) var from: (Double)-> Double
    private(set) var to: (Double)-> Double
    private(set) var country: Country
    
    init(symbol: String, name: String,category: Category, description: String = "", from: (Double)->Double, to: (Double)->Double, country: Country) {
        self.symbol = symbol
        self.name = name
        self.category = category
        self.description = description
        self.from = from
        self.to = to
        self.country = country
    }
}