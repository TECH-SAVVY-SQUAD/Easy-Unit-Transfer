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
    
    private init() {
        super.init(category: Category.WEIGHT, sourceUnit: Units.weightUnits.first!, sourceValue: 1, targetUnits: Units.weightUnits.filter({$0.symbol == "OZ" || $0.symbol == "LB"}))
    }
    
    static func getInstance() -> WeightUnitConverter {
        return weightUnitConverter
    }
    
}
