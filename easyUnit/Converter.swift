//
//  Converter.swift
//  easyUnit
//
//  Created by Wu on 3/24/16.
//  Copyright © 2016 Jiadong Wu. All rights reserved.
//

import Foundation

class Converter {
    
    private(set) var sourceUnit: Unit  // Source unit.
    private(set) var category: Category  // Category
    private(set) var sourceValue: Double  // Current Value
    private(set) var targetUnits: [Unit]  // Target units list.
    
    /**
    * Consturct
    * @param<Category> categroy The category of current converter.
    * @param<Unit> sourceUnit The init source unit.
    * @parma<Double> sourceValue The init source value.
    * @param<[Unit]> targetUnits The init target unit list.
    */
    init(category: Category, sourceUnit: Unit, sourceValue: Double, targetUnits: [Unit]) {
        self.category = category
        self.sourceUnit = sourceUnit
        self.sourceValue = sourceValue
        self.targetUnits = targetUnits
    }
    
    /**
    * Switch source unit to a new unit.
    * @param<Unit> newSourceUnit The new source unit.
    * @param<Double> value The current displayed value of the new source unit.
    * @return<Unit>
    */
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
    
    /**
     * Delete a unit from target units list.
     * @param<Unit> unit The target unit which user want to delete.
     */
    func delete(unit: Unit) {
        if unit.category == category {
            self.targetUnits = targetUnits.filter({$0.symbol != unit.symbol})
        }
    }
    
    /**
     * Add a unit to the target units list.
     * @param<Unit> unit The target unit which user want to add.
     */
    func add(unit: Unit) {
        if unit.category == category {
            if !targetUnits.contains({$0.symbol == unit.symbol}) && unit.symbol != sourceUnit.symbol {
                targetUnits.append(unit)
            }
        }
    }
    
    /**
     * Calculate the target value by providing two units.
     * @param<Unit> src The source unit.
     * @param<Unit> target The target unit.
     * @param<Double> value The current value of the source unit.
     * @return<Double>
     */
    func convert(src: Unit, target: Unit, value: Double) -> Double {
        if(src.category == target.category){
            return target.to(src.from(value))
        }
        return -1
    }
}