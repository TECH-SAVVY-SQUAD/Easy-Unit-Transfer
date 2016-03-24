//
//  WeightConverter.swift
//  easyUnit
//
//  Created by Wu on 2/25/16.
//  Copyright © 2016 Jiadong Wu. All rights reserved.
//

import Foundation

class WeightConverter {
    
    static var weightConverter = WeightConverter()
    
    // current units in list
    private var DisplayedWeightUnitDic = [String: Unit]()
    private var WeightUnitsDic = [String: Unit]()
    
    
    
    var currentUnit = "lb"
    var currentValue = 1.0
    private var weightInKg: Double = 1.0
    
    private init () {
        weightInKg = self.getWeight("lb")
        initAllWeightUnit()
    }
    
    func initAllWeightUnit() {
        //to do
        //read from disk
        let oz = Unit(symbol: "oz", category: 1, description: "ounce")
        let lb = Unit(symbol: "lb", category: 1, description: "pound")
        let g = Unit(symbol: "g", category: 1, description: "gram")
        let kg = Unit(symbol: "kg", category: 1, description: "kilogram")
        let stone = Unit(symbol: "stone", category: 1, description: "stone")
        WeightUnitsDic[oz.symbol] = oz
        WeightUnitsDic[lb.symbol] = lb
        WeightUnitsDic[g.symbol] = g
        WeightUnitsDic[kg.symbol] = kg
        WeightUnitsDic[stone.symbol] = stone
        
        DisplayedWeightUnitDic[oz.symbol] = oz
        DisplayedWeightUnitDic[g.symbol] = g
        DisplayedWeightUnitDic[kg.symbol] = kg
    }
    
    static func getWeightConverter() -> WeightConverter{
        return weightConverter
    }
    
    func getDisplayUnitArray() -> [Unit]{
        var ret = [Unit]()
        for (_, Unit) in DisplayedWeightUnitDic {
            ret.append(Unit)
        }
        return ret
        
    }
    
    func getAllUnitArray() -> [Unit]{
        var ret = [Unit]()
        for (_, Unit) in WeightUnitsDic {
            ret.append(Unit)
        }
        return ret
        
    }
    
    func setWeight(input: Double){
        currentValue = input
        switch currentUnit {
            case "oz":
                weightInKg = input*0.0283495
            case "lb":
                weightInKg = input*0.453592
            case "g":
                weightInKg = input/1000
            case "stone":
                weightInKg = input/6.35
            case "kg":
                weightInKg = input
            default:
                weightInKg = 1.0
        }
    }
    
    func getWeight(unitSymbol: String) -> Double {
        var ret: Double = 1.0
        switch unitSymbol {
        case "oz":
            ret = self.weightInKg/0.0283495
        case "lb":
            ret = self.weightInKg/0.453592
        case "g":
            ret = self.weightInKg*1000
        case "stone":
            ret = self.weightInKg*6.35
        case "kg":
            ret = self.weightInKg
        default:
            ret = 0
        }
        return ret
    }
    
    func switchUnit(unitSymbol: String) {
        let tmp = currentUnit
        self.currentUnit = unitSymbol
        deleteUnit(unitSymbol)
        addUnit(tmp)
    }
    
    func deleteUnit(unitSymbol: String) {
        DisplayedWeightUnitDic.removeValueForKey(unitSymbol)
    }
    
    func addUnit(unitSymbol: String){
        if(DisplayedWeightUnitDic[unitSymbol] == nil && self.currentUnit != unitSymbol){
            DisplayedWeightUnitDic[unitSymbol] = WeightUnitsDic[unitSymbol]
        }
    }
    
}