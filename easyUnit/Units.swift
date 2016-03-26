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
        units.append(Unit(symbol: "˚C", name: "Celsius",category: Category.TEMPERATURE, from: {$0}, to: {$0}, country: "SI"))
        units.append(Unit(symbol: "F", name: "Fahrenheit",category: Category.TEMPERATURE, from: {($0 - 32)*5/9}, to: {$0 * 9/5 + 32}, country: "US"))
        return units
    }
    
    class var weightUnits: [Unit] {
        var units = [Unit]()
        units.append(Unit(symbol: "kg", name: "Kilogram", category: Category.WEIGHT, from: {$0}, to: {$0}, country: "SI"))
        units.append(Unit(symbol: "g", name: "Gram", category: Category.WEIGHT, from: {$0/1000}, to: {$0*1000}, country: "SI"))
        units.append(Unit(symbol: "oz", name: "Ounce", category: Category.WEIGHT, from: {$0*0.453592}, to: {$0/0.453592}, country: "US"))
        units.append(Unit(symbol: "lb", name: "Pound", category: Category.WEIGHT, from: {$0*0.0283495}, to: {$0/0.0283495}, country: "US"))
        units.append(Unit(symbol: "stone", name: "Stone", category: Category.WEIGHT, from: {$0/6.35}, to: {$0*6.35}, country: "US"))
        units.append(Unit(symbol:"t", name: "Ton", category: Category.WEIGHT, from: {$0*1000}, to: {$0/1000}, country: "SI"))
        return units
    }
    
    class var lengthUnits: [Unit] {
        var units = [Unit]()
        units.append(Unit(symbol: "m", name: "Meter", category: Category.LENGTH, from: {$0}, to: {$0}, country: "SI"))
        units.append(Unit(symbol: "mm", name: "Millimetre", category: Category.LENGTH, from: {$0*0.001}, to: {$0/0.001}, country: "SI"))
        units.append(Unit(symbol: "cm", name: "Centimetre", category: Category.LENGTH, from: {$0*0.01}, to: {$0/0.01}, country: "SI"))
        units.append(Unit(symbol: "km", name: "Kilomete", category: Category.LENGTH, from: {$0*1000}, to: {$0/1000}, country: "SI"))
        units.append(Unit(symbol: "inch", name: "Inch", category: Category.LENGTH, from: {$0*0.0254}, to: {$0/0.0254}, country: "US"))
        units.append(Unit(symbol: "foot", name: "Foot", category: Category.LENGTH, from: {$0*0.3048}, to: {$0/0.3048}, country: "US"))
        units.append(Unit(symbol:"yard", name: "Yard", category: Category.LENGTH, from: {$0*0.9144}, to: {$0/0.9144}, country: "US"))
        units.append(Unit(symbol: "mile", name: "Mile", category: Category.LENGTH, from: {$0*1609.344}, to: {$0/1609.344}, country: "US"))
        return units
    }
    
    class var volumeUnits: [Unit] {
        var units = [Unit]()
        units.append(Unit(symbol: "l", name: "Litre", category: Category.VOLUME, from: {$0*1000}, to: {$0/1000}, country: "SI"))
        units.append(Unit(symbol: "ml", name: "Millilitre", category: Category.VOLUME, from: {$0}, to: {$0}, country: "SI"))
        units.append(Unit(symbol: "jig", name: "US shot", category: Category.VOLUME, from: {$0*44.36029434375}, to: {$0/44.36029434375}, country: "US"))
        units.append(Unit(symbol: "gi", name: "US gill", category: Category.VOLUME, from: {$0*118.29411825}, to: {$0/118.29411825}, country: "US"))
        units.append(Unit(symbol: "cp", name: "US cup", category: Category.VOLUME, from: {$0*236.5882365}, to: {$0/236.5882365}, country: "US"))
        units.append(Unit(symbol:"pt", name: "US pint", category: Category.VOLUME, from: {$0*473.176473}, to: {$0/473.176473}, country: "US"))
        units.append(Unit(symbol: "qt", name: "US quart", category: Category.VOLUME, from: {$0*946.352946}, to: {$0/946.352946}, country: "US"))
        units.append(Unit(symbol: "gal", name: "US gallon", category: Category.VOLUME, from: {$0*3785.411784}, to: {$0/3785.411784}, country: "US"))
        return units
    }
    
    
    
}