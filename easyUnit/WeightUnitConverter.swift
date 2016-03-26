//
//  WeightUnitConverter.swift
//  easyUnit
//
//  Created by Wu on 3/24/16.
//  Copyright © 2016 Jiadong Wu. All rights reserved.
//

import Foundation

class WeightUnitConverter : Converter{
    
    static private var weightUnitConverter = WeightUnitConverter()
    
    private override init() {
        super.init()
        // TODO
        // Check first is vaild or not
        super.category = Category.WEIGHT
        super.sourceUnit = Units.weightUnits.first!
        super.targetUnits = Units.weightUnits.filter({$0.country == "US"})
    }
    
    static func getInstance() -> WeightUnitConverter {
        return weightUnitConverter
    }
    
}
