//
//  Converter.swift
//  easyUnit
//
//  Created by Wu on 3/24/16.
//  Copyright © 2016 Jiadong Wu. All rights reserved.
//

import Foundation

class Converter {
    
    // Source Unit
    var sourceUnit: Unit = Unit()
    
    // Category
    var category: Int = -1
    
    var sourceValue: Double = 1
    
    // Target Units list
    var targetUnits: [Unit] = []
    
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
    
    func delete(unit: Unit) {
        if unit.category == category {
            self.targetUnits = targetUnits.filter({$0.symbol != unit.symbol})
        }
    }
    
    func add(unit: Unit) {
        if unit.category == category {
            if !targetUnits.contains({$0.symbol == unit.symbol}) && unit.symbol != sourceUnit.symbol {
                targetUnits.append(unit)
            }
        }
    }
    
    func convert(SrcUnit: Unit, TargetUnit: Unit, value: Double) -> Double {
        if(SrcUnit.category == TargetUnit.category){
            return TargetUnit.to(SrcUnit.from(value))
        }
        return -1
    }
}