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
    
    private init() {
        super.init(category: Category.TEMPERATURE, sourceUnit: Units.temperatureUnits.first!, sourceValue: 1, targetUnits: Units.temperatureUnits.filter({$0.symbol == "˚F" || $0.symbol == "K"}))
    }
    
    static func getInstance() -> TemperatureUnitConverter {
        return temperatureUnitConverter
    }
    
}