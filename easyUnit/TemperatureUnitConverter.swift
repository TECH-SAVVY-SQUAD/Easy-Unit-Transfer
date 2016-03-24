//
//  TemperatureUnitConverter.swift
//  easyUnit
//
//  Created by Wu on 3/18/16.
//  Copyright © 2016 Jiadong Wu. All rights reserved.
//

import Foundation

class TemperatureUnitConverter {
    
    class var temperatureUnits: [String:Unit] {
        var units = [String:Unit]()
        let celsius = Unit(symbol: "˚C", name: "Celsius",category: 4,from: {$0}, to: {$0}, country: "SI")
        let fahrenheit = Unit(symbol: "F", name: "Fahrenheit",category: 4,from: {($0 - 32)*5/9}, to: {$0 * 9/5 + 32}, country: "US")
        units[celsius.symbol] = celsius
        units[fahrenheit.symbol] = fahrenheit
        return units;
    }
    
    private init() {
    }
    
    
    // convert
    static func convert(from: String, to: String, value: Double) -> Double {
        if let unit1 = self.temperatureUnits[from] {
            if let unit2 = self.temperatureUnits[to] {
                return unit2.to(unit1.from(value))
            }
        }
        return -1
    }
    
    static func getUnitsList(except: String) -> [Unit] {
        var units = [Unit]()
        for(symbol,unit) in temperatureUnits {
            if symbol != except {
                units.append(unit)
            }
        }
        return units
    }
    
    
}
