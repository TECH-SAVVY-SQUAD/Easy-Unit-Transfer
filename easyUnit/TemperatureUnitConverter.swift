//
//  TemperatureUnitConverter.swift
//  easyUnit
//
//  Created by Wu on 3/18/16.
//  Copyright © 2016 Jiadong Wu. All rights reserved.
//

import Foundation

class TemperatureUnitConverter: Converter{
    
    static private var temperatureUnitConverter = TemperatureUnitConverter()
    
    private override init() {
        super.init()
        // TODO
        // Check first is vaild or not
        super.sourceUnit = Units.temperatureUnits.first!
        super.targetUnits = Units.temperatureUnits.filter({$0.symbol == "˚F" || $0.symbol == "K"})
    }
    
    static func getInstance() -> TemperatureUnitConverter {
        return temperatureUnitConverter
    }
    
}