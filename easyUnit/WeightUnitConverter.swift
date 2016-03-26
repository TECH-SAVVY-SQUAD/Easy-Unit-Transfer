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
        super.sourceUnit = Units.weightUnits.first!
        super.targetUnits = Units.weightUnits.filter({$0.symbol != "g"})
    }
    
    static func getInstance() -> WeightUnitConverter {
        return weightUnitConverter
    }
    
}
