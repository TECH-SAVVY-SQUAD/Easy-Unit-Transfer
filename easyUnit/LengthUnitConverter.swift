//
//  LengthUnitConverter.swift
//  easyUnit
//
//  Created by Wu on 3/25/16.
//  Copyright © 2016 Jiadong Wu. All rights reserved.
//

import Foundation

class LengthUnitConverter: Converter {
    static private var lengthUnitConverter = LengthUnitConverter()
    
    private init() {
        super.init(category: Category.LENGTH, sourceUnit: Units.lengthUnits.first!, sourceValue: 1, targetUnits: Units.lengthUnits.filter({$0.symbol == "IN" || $0.symbol == "FT"}))
    }
    
    static func getInstance() -> LengthUnitConverter {
        return lengthUnitConverter
    }
}