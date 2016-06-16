//
//  PersistencyManager.swift
//  easyUnit
//
//  Created by Wu on 6/13/16.
//  Copyright © 2016 Jiadong Wu. All rights reserved.
//

import Foundation

class PersisitencyManager {
    private var units = [Unit]()
    private var sourceUnit: Unit  // Source unit.
    private var sourceValue: Double  // Current Value
    private var category: Category  // Category
    private var targetUnits = [Unit]()  // Target units list.
    
    init(catetory: Category){
        self.category = catetory
        self.sourceValue = 1.0
        switch catetory {
        case .LENGTH:
            self.units.append(Unit(symbol: "M", name: "METER", category: Category.LENGTH, from: {$0}, to: {$0}, country: Country.CN))
            self.units.append(Unit(symbol: "MM", name: "MILLIMETER", category: Category.LENGTH, from: {$0*0.001}, to: {$0/0.001}, country: Country.CN))
            self.units.append(Unit(symbol: "CM", name: "CENTIMETER", category: Category.LENGTH, from: {$0*0.01}, to: {$0/0.01}, country: Country.CN))
            self.units.append(Unit(symbol: "KM", name: "KILOMETER", category: Category.LENGTH, from: {$0*1000}, to: {$0/1000}, country: Country.CN))
            self.units.append(Unit(symbol: "IN", name: "INCH", category: Category.LENGTH, from: {$0*0.0254}, to: {$0/0.0254}, country: Country.US))
            self.units.append(Unit(symbol: "FT", name: "FOOT", category: Category.LENGTH, from: {$0*0.3048}, to: {$0/0.3048}, country: Country.US))
            self.units.append(Unit(symbol:"YD", name: "YARD", category: Category.LENGTH, from: {$0*0.9144}, to: {$0/0.9144}, country: Country.US))
            self.units.append(Unit(symbol: "MI", name: "MILE", category: Category.LENGTH, from: {$0*1609.344}, to: {$0/1609.344}, country: Country.US))
            self.sourceUnit = Unit(symbol: "M", name: "METER", category: Category.LENGTH, from: {$0}, to: {$0}, country: Country.CN)
            self.targetUnits.append(Unit(symbol: "IN", name: "INCH", category: Category.LENGTH, from: {$0*0.0254}, to: {$0/0.0254}, country: Country.US))
            self.targetUnits.append(Unit(symbol: "FT", name: "FOOT", category: Category.LENGTH, from: {$0*0.3048}, to: {$0/0.3048}, country: Country.US))
            break
        case .TEMPERATURE:
            self.units.append(Unit(symbol: "˚C", name: "CELSIUS", category: Category.TEMPERATURE, from: {$0}, to: {$0}, country: Country.CN))
            self.units.append(Unit(symbol: "˚F", name: "FAHRENHEIT", category: Category.TEMPERATURE, from: {($0 - 32)*5/9}, to: {$0 * 9/5 + 32}, country: Country.US))
            self.units.append(Unit(symbol: "K", name: "KELVIN", category: Category.TEMPERATURE, from: {$0 - 273.15}, to: {$0 + 273.15}, country: Country.US))
            self.sourceUnit = Unit(symbol: "˚C", name: "CELSIUS", category: Category.TEMPERATURE, from: {$0}, to: {$0}, country: Country.CN)
            self.targetUnits.append(Unit(symbol: "˚F", name: "FAHRENHEIT", category: Category.TEMPERATURE, from: {($0 - 32)*5/9}, to: {$0 * 9/5 + 32}, country: Country.US))
            self.targetUnits.append(Unit(symbol: "K", name: "KELVIN", category: Category.TEMPERATURE, from: {$0 - 273.15}, to: {$0 + 273.15}, country: Country.US))
        case .VOLUME:
            self.units.append(Unit(symbol: "L", name: "LITRE", category: Category.VOLUME, from: {$0*1000}, to: {$0/1000}, country: Country.CN))
            self.units.append(Unit(symbol: "ML", name: "MILLILITRE", category: Category.VOLUME, from: {$0}, to: {$0}, country: Country.CN))
            self.units.append(Unit(symbol: "TSP", name: "TEASPOON", category: Category.VOLUME, from: {$0*4.92892159375}, to: {$0/4.92892159375}, country: Country.US))
            self.units.append(Unit(symbol: "TBSP", name: "TABLESPOON", category: Category.VOLUME, from: {$0*14.78676478125}, to: {$0/14.78676478125}, country: Country.US))
            self.units.append(Unit(symbol: "FL_OZ", name: "US_FLUID_OUNCE", category: Category.VOLUME, from: {$0*29.5735295625}, to: {$0/29.5735295625}, country: Country.US))
            self.units.append(Unit(symbol: "Gi", name: "US_GILL", category: Category.VOLUME, from: {$0*118.29411825}, to: {$0/118.29411825}, country: Country.US))
            self.units.append(Unit(symbol:"PT", name: "US_PINT", category: Category.VOLUME, from: {$0*473.176473}, to: {$0/473.176473}, country: Country.US))
            self.units.append(Unit(symbol: "QT", name: "US_QUART", category: Category.VOLUME, from: {$0*946.352946}, to: {$0/946.352946}, country: Country.US))
            self.units.append(Unit(symbol: "GAL_US", name: "US_GALLON", category: Category.VOLUME, from: {$0*3785.411784}, to: {$0/3785.411784}, country: Country.US))
            self.units.append(Unit(symbol: "BBL", name: "BARREL", category: Category.VOLUME, from: {$0*119240.471196}, to: {$0/119240.471196}, country: Country.US))
            self.units.append(Unit(symbol: "GAL_UK", name: "UK_GALLON", category: Category.VOLUME, from: {$0*4546.09}, to: {$0/4546.09}, country: Country.UK))
            self.sourceUnit = Unit(symbol: "L", name: "LITRE", category: Category.VOLUME, from: {$0*1000}, to: {$0/1000}, country: Country.CN)
            self.targetUnits.append(Unit(symbol: "FL_OZ", name: "US_FLUID_OUNCE", category: Category.VOLUME, from: {$0*29.5735295625}, to: {$0/29.5735295625}, country: Country.US))
            break
        case .WEIGHT:
            self.units.append(Unit(symbol: "KG", name: "KILOGRAM", category: Category.WEIGHT, from: {$0}, to: {$0}, country: Country.CN))
            self.units.append(Unit(symbol: "G", name: "GRAM", category: Category.WEIGHT, from: {$0/1000}, to: {$0*1000}, country: Country.CN))
            self.units.append(Unit(symbol:"T", name: "TON", category: Category.WEIGHT, from: {$0*1000}, to: {$0/1000}, country: Country.CN))
            self.units.append(Unit(symbol: "OZ", name: "OUNCE", category: Category.WEIGHT, from: {$0*0.0283495}, to: {$0/0.0283495}, country: Country.US))
            self.units.append(Unit(symbol: "LB", name: "POUND", category: Category.WEIGHT, from: {$0*0.453592}, to: {$0/0.453592}, country: Country.US))
            self.units.append(Unit(symbol: "CWT", name: "US_HUNDREDWEIGHT", category: Category.WEIGHT, from: {$0/45.359237}, to: {$0*45.359237}, country: Country.US))
            self.units.append(Unit(symbol: "TON_US", name: "SHORT_TON", category: Category.WEIGHT, from: {$0/907.18474}, to: {$0*907.18474}, country: Country.US))
            self.units.append(Unit(symbol: "ST", name: "STONE", category: Category.WEIGHT, from: {$0/6.35}, to: {$0*6.35}, country: Country.US))
            self.units.append(Unit(symbol: "TON_UK", name: "LONG_TON", category: Category.WEIGHT, from: {$0/1016.0469088}, to: {$0*1016.0469088}, country: Country.UK))
            self.sourceUnit = Unit(symbol: "KG", name: "KILOGRAM", category: Category.WEIGHT, from: {$0}, to: {$0}, country: Country.CN)
            self.targetUnits.append(Unit(symbol: "OZ", name: "OUNCE", category: Category.WEIGHT, from: {$0*0.0283495}, to: {$0/0.0283495}, country: Country.US))
            self.targetUnits.append(Unit(symbol: "LB", name: "POUND", category: Category.WEIGHT, from: {$0*0.453592}, to: {$0/0.453592}, country: Country.US))
            break
        }
    }
    
    // Get all units for current category.
    // @return <[Unit]>
    func getUnits() -> [Unit] {
        return self.units
    }
    
    // Get all target units for current category.
    // @return <[Unit]>
    func getTargtUnits() -> [Unit] {
        return self.targetUnits
    }
    
    // Switch source unit to a new unit.
    // @param<Unit> newSourceUnit The new source unit.
    // @param<Double> value The current displayed value of the new source unit.
    // @return<Unit>
    func switchSourceUnit(newSourceUnit: Unit, value: Double) -> Unit{
        for i in 0 ..< targetUnits.count {
            if(targetUnits[i].symbol == newSourceUnit.symbol){
                targetUnits[i] = self.sourceUnit
                break
            }
        }
        self.sourceUnit = newSourceUnit
        self.sourceValue = value
        return sourceUnit
    }
    
    // Get the sourceUnit
    // @return<Unit>
    func getSourceUnit() -> Unit {
        return self.sourceUnit
    }
    
    // Get the sourceValue
    // @return<Double>
    func getSourceValue() -> Double {
        return self.sourceValue
    }
    
    
    // Delete a unit from target units list.
    // @param<Unit> unit The target unit which user want to delete.
    func deleteUnit(unit: Unit) {
        if unit.category == category {
            self.targetUnits = targetUnits.filter({$0.symbol != unit.symbol})
        }
    }
    
    // Add a unit to the target units list.
    // @param<Unit> unit The target unit which user want to add.
    func addUnit(unit: Unit) {
        if unit.category == category {
            if !targetUnits.contains({$0.symbol == unit.symbol}) && unit.symbol != sourceUnit.symbol {
                targetUnits.append(unit)
            }
        }
    }
    
    // Calculate the target value by providing two units.
    // @param<Unit> src The source unit.
    // @param<Unit> target The target unit.
    // @param<Double> value The current value of the source unit.
    // @return<Double>
    func convert(src: Unit, target: Unit, value: Double) -> Double {
        if(src.category == target.category){
            return target.to(src.from(value))
        }
        return -1
    }
    
}