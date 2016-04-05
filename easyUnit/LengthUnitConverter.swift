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
    
    private override init() {
        super.init()
        // TODO
        // Check first is vaild or not
        super.category = Category.LENGTH
        super.sourceUnit = Units.lengthUnits.first!
        super.targetUnits = Units.lengthUnits.filter({$0.symbol == "Inch" || $0.symbol == "Foot"})
    }
    
    static func getInstance() -> LengthUnitConverter {
        return lengthUnitConverter
    }
}