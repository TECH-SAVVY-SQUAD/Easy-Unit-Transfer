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
    
    var sourceValue: Double = 1.0
    
    // Target Units list
    var targetUnits: [Unit] = []
    
    func switchSourceUnit(newSourceUnit: Unit, value: Double) -> Unit{
        self.targetUnits = targetUnits.filter({$0.symbol != newSourceUnit.symbol})
        self.targetUnits.append(sourceUnit)
        self.sourceUnit = newSourceUnit
        self.sourceValue = value
        return sourceUnit
    }
    
    func delete(unit: Unit) {
        if unit.category == Category.WEIGHT {
            self.targetUnits = targetUnits.filter({$0.symbol != unit.symbol})
        }
    }
    
    func add(unit: Unit) {
        if unit.category == Category.WEIGHT {
            if !targetUnits.contains({$0.symbol == unit.symbol}) {
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