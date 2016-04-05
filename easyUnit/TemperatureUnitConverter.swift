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
    
    private let colors = ["#FFFDE7","#FFF9C4","#FFF59D","#FFF176","#FFEE58","#FFEB3B","#FDD835","#FBC02D","#F9A825","#F57F17"]
    
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
    
    func getColor() -> String{
        let index = (super.sourceUnit.from(super.sourceValue) <= 90) ? Int(super.sourceUnit.from(super.sourceValue)/10) : 9
        return colors[index]
    }

    
}