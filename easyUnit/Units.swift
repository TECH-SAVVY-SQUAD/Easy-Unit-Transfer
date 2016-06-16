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
        units.append(Unit(symbol: "˚C", name: "CELSIUS", category: Category.TEMPERATURE, from: {$0}, to: {$0}, country: Country.CN))
        units.append(Unit(symbol: "˚F", name: "FAHRENHEIT", category: Category.TEMPERATURE, from: {($0 - 32)*5/9}, to: {$0 * 9/5 + 32}, country: Country.US))
        units.append(Unit(symbol: "K", name: "KELVIN", category: Category.TEMPERATURE, from: {$0 - 273.15}, to: {$0 + 273.15}, country: Country.US))
        return units
    }
    
    class var weightUnits: [Unit] {
        var units = [Unit]()
        units.append(Unit(symbol: "KG", name: "KILOGRAM", category: Category.WEIGHT, from: {$0}, to: {$0}, country: Country.CN))
        units.append(Unit(symbol: "G", name: "GRAM", category: Category.WEIGHT, from: {$0/1000}, to: {$0*1000}, country: Country.CN))
        units.append(Unit(symbol:"T", name: "TON", category: Category.WEIGHT, from: {$0*1000}, to: {$0/1000}, country: Country.CN))
        units.append(Unit(symbol: "OZ", name: "OUNCE", category: Category.WEIGHT, from: {$0*0.0283495}, to: {$0/0.0283495}, country: Country.US))
        units.append(Unit(symbol: "LB", name: "POUND", category: Category.WEIGHT, from: {$0*0.453592}, to: {$0/0.453592}, country: Country.US))
        units.append(Unit(symbol: "CWT", name: "US_HUNDREDWEIGHT", category: Category.WEIGHT, from: {$0/45.359237}, to: {$0*45.359237}, country: Country.US))
        units.append(Unit(symbol: "TON_US", name: "SHORT_TON", category: Category.WEIGHT, from: {$0/907.18474}, to: {$0*907.18474}, country: Country.US))
        units.append(Unit(symbol: "ST", name: "STONE", category: Category.WEIGHT, from: {$0/6.35}, to: {$0*6.35}, country: Country.US))
        units.append(Unit(symbol: "TON_UK", name: "LONG_TON", category: Category.WEIGHT, from: {$0/1016.0469088}, to: {$0*1016.0469088}, country: Country.UK))
        return units
    }
    
    class var lengthUnits: [Unit] {
        var units = [Unit]()
        units.append(Unit(symbol: "M", name: "METER", category: Category.LENGTH, from: {$0}, to: {$0}, country: Country.CN))
        units.append(Unit(symbol: "MM", name: "MILLIMETER", category: Category.LENGTH, from: {$0*0.001}, to: {$0/0.001}, country: Country.CN))
        units.append(Unit(symbol: "CM", name: "CENTIMETER", category: Category.LENGTH, from: {$0*0.01}, to: {$0/0.01}, country: Country.CN))
        units.append(Unit(symbol: "KM", name: "KILOMETER", category: Category.LENGTH, from: {$0*1000}, to: {$0/1000}, country: Country.CN))
        units.append(Unit(symbol: "IN", name: "INCH", category: Category.LENGTH, from: {$0*0.0254}, to: {$0/0.0254}, country: Country.US))
        units.append(Unit(symbol: "FT", name: "FOOT", category: Category.LENGTH, from: {$0*0.3048}, to: {$0/0.3048}, country: Country.US))
        units.append(Unit(symbol:"YD", name: "YARD", category: Category.LENGTH, from: {$0*0.9144}, to: {$0/0.9144}, country: Country.US))
        units.append(Unit(symbol: "MI", name: "MILE", category: Category.LENGTH, from: {$0*1609.344}, to: {$0/1609.344}, country: Country.US))
        return units
    }
    
    class var volumeUnits: [Unit] {
        var units = [Unit]()
        units.append(Unit(symbol: "L", name: "LITRE", category: Category.VOLUME, from: {$0*1000}, to: {$0/1000}, country: Country.CN))
        units.append(Unit(symbol: "ML", name: "MILLILITRE", category: Category.VOLUME, from: {$0}, to: {$0}, country: Country.CN))
        units.append(Unit(symbol: "TSP", name: "TEASPOON", category: Category.VOLUME, from: {$0*4.92892159375}, to: {$0/4.92892159375}, country: Country.US))
        units.append(Unit(symbol: "TBSP", name: "TABLESPOON", category: Category.VOLUME, from: {$0*14.78676478125}, to: {$0/14.78676478125}, country: Country.US))
        units.append(Unit(symbol: "FL_OZ", name: "US_FLUID_OUNCE", category: Category.VOLUME, from: {$0*29.5735295625}, to: {$0/29.5735295625}, country: Country.US))
        units.append(Unit(symbol: "Gi", name: "US_GILL", category: Category.VOLUME, from: {$0*118.29411825}, to: {$0/118.29411825}, country: Country.US))
        units.append(Unit(symbol:"PT", name: "US_PINT", category: Category.VOLUME, from: {$0*473.176473}, to: {$0/473.176473}, country: Country.US))
        units.append(Unit(symbol: "QT", name: "US_QUART", category: Category.VOLUME, from: {$0*946.352946}, to: {$0/946.352946}, country: Country.US))
        units.append(Unit(symbol: "GAL_US", name: "US_GALLON", category: Category.VOLUME, from: {$0*3785.411784}, to: {$0/3785.411784}, country: Country.US))
        units.append(Unit(symbol: "BBL", name: "BARREL", category: Category.VOLUME, from: {$0*119240.471196}, to: {$0/119240.471196}, country: Country.US))
        units.append(Unit(symbol: "GAL_UK", name: "UK_GALLON", category: Category.VOLUME, from: {$0*4546.09}, to: {$0/4546.09}, country: Country.UK))
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