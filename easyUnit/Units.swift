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
        units.append(Unit(symbol: "˚C", name: "Celsius",category: Category.TEMPERATURE, from: {$0}, to: {$0}, country: "CN"))
        units.append(Unit(symbol: "˚F", name: "Fahrenheit",category: Category.TEMPERATURE, from: {($0 - 32)*5/9}, to: {$0 * 9/5 + 32}, country: "US"))
        units.append(Unit(symbol: "K", name: "Kelvin",category: Category.TEMPERATURE, from: {$0 - 273.15}, to: {$0 + 273.15}, country: "US"))
        return units
    }
    
    class var weightUnits: [Unit] {
        var units = [Unit]()
        units.append(Unit(symbol: "Kg", name: "Kilogram", category: Category.WEIGHT, from: {$0}, to: {$0}, country: "CN"))
        units.append(Unit(symbol: "G", name: "Gram", category: Category.WEIGHT, from: {$0/1000}, to: {$0*1000}, country: "CN"))
        units.append(Unit(symbol:"T", name: "Ton", category: Category.WEIGHT, from: {$0*1000}, to: {$0/1000}, country: "CN"))
        units.append(Unit(symbol: "Oz", name: "Ounce", category: Category.WEIGHT, from: {$0*0.0283495}, to: {$0/0.0283495}, country: "US"))
        units.append(Unit(symbol: "Lb", name: "Pound", category: Category.WEIGHT, from: {$0*0.453592}, to: {$0/0.453592}, country: "US"))
        units.append(Unit(symbol: "Cwt", name: "US hundredweight", category: Category.WEIGHT, from: {$0/45.359237}, to: {$0*45.359237}, country: "US"))
        units.append(Unit(symbol: "Ton-US", name: "Short ton", category: Category.WEIGHT, from: {$0/907.18474}, to: {$0*907.18474}, country: "US"))
        units.append(Unit(symbol: "Stone", name: "Stone", category: Category.WEIGHT, from: {$0/6.35}, to: {$0*6.35}, country: "US"))
        units.append(Unit(symbol: "Ton-UK", name: "Long ton", category: Category.WEIGHT, from: {$0/1016.0469088}, to: {$0*1016.0469088}, country: "UK"))
        return units
    }
    
    class var lengthUnits: [Unit] {
        var units = [Unit]()
        units.append(Unit(symbol: "M", name: "Meter", category: Category.LENGTH, from: {$0}, to: {$0}, country: "CN"))
        units.append(Unit(symbol: "Mm", name: "Millimetre", category: Category.LENGTH, from: {$0*0.001}, to: {$0/0.001}, country: "CN"))
        units.append(Unit(symbol: "Cm", name: "Centimetre", category: Category.LENGTH, from: {$0*0.01}, to: {$0/0.01}, country: "CN"))
        units.append(Unit(symbol: "Km", name: "Kilomete", category: Category.LENGTH, from: {$0*1000}, to: {$0/1000}, country: "CN"))
        units.append(Unit(symbol: "Inch", name: "Inch", category: Category.LENGTH, from: {$0*0.0254}, to: {$0/0.0254}, country: "US"))
        units.append(Unit(symbol: "Foot", name: "Foot", category: Category.LENGTH, from: {$0*0.3048}, to: {$0/0.3048}, country: "US"))
        units.append(Unit(symbol:"Yard", name: "Yard", category: Category.LENGTH, from: {$0*0.9144}, to: {$0/0.9144}, country: "US"))
        units.append(Unit(symbol: "Mile", name: "Mile", category: Category.LENGTH, from: {$0*1609.344}, to: {$0/1609.344}, country: "US"))
        return units
    }
    
    class var volumeUnits: [Unit] {
        var units = [Unit]()
        units.append(Unit(symbol: "L", name: "Litre", category: Category.VOLUME, from: {$0*1000}, to: {$0/1000}, country: "CN"))
        units.append(Unit(symbol: "ML", name: "Millilitre", category: Category.VOLUME, from: {$0}, to: {$0}, country: "CN"))
        units.append(Unit(symbol: "Tsp", name: "Teaspoon", category: Category.VOLUME, from: {$0*4.92892159375}, to: {$0/4.92892159375}, country: "US"))
        units.append(Unit(symbol: "Tbsp", name: "Tablespoon", category: Category.VOLUME, from: {$0*14.78676478125}, to: {$0/14.78676478125}, country: "US"))
        units.append(Unit(symbol: "Fl oz", name: "US fluid ounce", category: Category.VOLUME, from: {$0*29.5735295625}, to: {$0/29.5735295625}, country: "US"))
        units.append(Unit(symbol: "Gig", name: "US shot", category: Category.VOLUME, from: {$0*44.36029434375}, to: {$0/44.36029434375}, country: "US"))
        units.append(Unit(symbol: "Gi", name: "US gill", category: Category.VOLUME, from: {$0*118.29411825}, to: {$0/118.29411825}, country: "US"))
        units.append(Unit(symbol: "Cp", name: "US cup", category: Category.VOLUME, from: {$0*236.5882365}, to: {$0/236.5882365}, country: "US"))
        units.append(Unit(symbol:"Pt", name: "US pint", category: Category.VOLUME, from: {$0*473.176473}, to: {$0/473.176473}, country: "US"))
        units.append(Unit(symbol: "Qt", name: "US quart", category: Category.VOLUME, from: {$0*946.352946}, to: {$0/946.352946}, country: "US"))
        units.append(Unit(symbol: "Gal-US", name: "US gallon", category: Category.VOLUME, from: {$0*3785.411784}, to: {$0/3785.411784}, country: "US"))
        units.append(Unit(symbol: "Bbl", name: "Barrel", category: Category.VOLUME, from: {$0*119240.471196}, to: {$0/119240.471196}, country: "US"))
        units.append(Unit(symbol: "Gal-UK", name: "UK gallon", category: Category.VOLUME, from: {$0*4546.09}, to: {$0/4546.09}, country: "UK"))
        return units
    }
    
    static func getGategorizedUnitList() -> [[Unit]] {
        var res = [[Unit]]()
        res.append(weightUnits)
        res.append(lengthUnits)
        res.append(volumeUnits)
        return res
    }
    
}