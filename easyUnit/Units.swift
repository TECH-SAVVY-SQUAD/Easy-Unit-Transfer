//
//  Units.swift
//  easyUnit
//
//  Created by Wu on 3/23/16.
//  Copyright © 2016 Jiadong Wu. All rights reserved.
//

import Foundation

class Units {
    private init(){}
    
    class var temperatureUnits: [Unit] {
        var units = [Unit]()
        units.append(Unit(symbol: "˚C", name: "Celsius",category: 4, from: {$0}, to: {$0}, country: "SI"))
        units.append(Unit(symbol: "F", name: "Fahrenheit",category: 4, from: {($0 - 32)*5/9}, to: {$0 * 9/5 + 32}, country: "US"))
        return units
    }
    
    class var weightUnits: [Unit] {
        var units = [Unit]()
        units.append(Unit(symbol: "oz", name: "Ounce", category: 1, from: {$0*0.453592}, to: {$0/0.453592}, country: "US"))
        units.append(Unit(symbol: "lb", name: "Pound", category: 1, from: {$0*0.0283495}, to: {$0/0.0283495}, country: "US"))
        units.append(Unit(symbol: "g", name: "Gram", category: 1, from: {$0/1000}, to: {$0*1000}, country: "SI"))
        units.append(Unit(symbol: "kg", name: "Kilogram", category: 1, from: {$0}, to: {$0}, country: "SI"))
        units.append(Unit(symbol: "stone", name: "Stone", category: 1, from: {$0/6.35}, to: {$0*6.35}, country: "US"))
        units.append(Unit(symbol:"t", name: "Ton", category: 1, from: {$0*1000}, to: {$0/1000}, country: "SI"))
        return units
    }
    
    class var lengthUnits: [Unit] {
        var units = [Unit]()
        units.append(Unit(symbol: "mm", name: "Millimetre", category: 2, from: {$0*0.001}, to: {$0/0.001}, country: "SI"))
        units.append(Unit(symbol: "cm", name: "Centimetre", category: 2, from: {$0*0.01}, to: {$0/0.01}, country: "SI"))
        units.append(Unit(symbol: "m", name: "Meter", category: 2, from: {$0}, to: {$0}, country: "SI"))
        units.append(Unit(symbol: "km", name: "Kilomete", category: 2, from: {$0*1000}, to: {$0/1000}, country: "SI"))
        units.append(Unit(symbol: "inch", name: "Inch", category: 2, from: {$0*0.0254}, to: {$0/0.0254}, country: "US"))
        units.append(Unit(symbol: "foot", name: "Foot", category: 2, from: {$0*0.3048}, to: {$0/0.3048}, country: "US"))
        units.append(Unit(symbol:"yard", name: "Yard", category: 2, from: {$0*0.9144}, to: {$0/0.9144}, country: "US"))
        units.append(Unit(symbol: "mile", name: "Mile", category: 2, from: {$0*1609.344}, to: {$0/1609.344}, country: "US"))
        return units
    }
    
    class var volumeUnits: [Unit] {
        var units = [Unit]()
        units.append(Unit(symbol: "ml", name: "Millimetre", category: 3, from: {$0*0.001}, to: {$0/0.001}, country: "US"))
        units.append(Unit(symbol: "l", name: "Centimetre", category: 2, from: {$0*0.01}, to: {$0/0.01}, country: "US"))
        units.append(Unit(symbol: "jig", name: "Kilomete", category: 1, from: {$0*1000}, to: {$0/1000}, country: "US"))
        units.append(Unit(symbol: "gi", name: "Inch", category: 1, from: {$0*0.0254}, to: {$0/0.0254}, country: "US"))
        units.append(Unit(symbol: "cp", name: "Foot", category: 1, from: {$0*0.3048}, to: {$0/0.3048}, country: "US"))
        units.append(Unit(symbol:"pt", name: "Yard", category: 1, from: {$0*0.9144}, to: {$0/0.9144}, country: "US"))
        units.append(Unit(symbol: "qt", name: "Mile", category: 1, from: {$0*1609.344}, to: {$0/1609.344}, country: "US"))
        units.append(Unit(symbol: "gal", name: "Mile", category: 1, from: {$0*1609.344}, to: {$0/1609.344}, country: "US"))
        return units
    }
    
    
}