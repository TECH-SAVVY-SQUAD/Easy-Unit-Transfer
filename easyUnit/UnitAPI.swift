//
//  UnitAPI.swift
//  easyUnit
//
//  This API interface is deisgned based on Facade design model.
//  Right now only PersitencyManager is the only unit resource provider. But in the futurn if we want to add SQL database as unit resource provider, just add it here without affecting the existing PersitencyManager
//  Created by Wu on 6/13/16.
//  Copyright © 2016 Jiadong Wu. All rights reserved.
//

import Foundation

class UnitAPI {
    private let temperatureUnitsPersitencyManager : PersisitencyManager
    private let lengthUnitsPersitencyManager : PersisitencyManager
    private let volumeUnitsPersitencyManager : PersisitencyManager
    private let weightUnitsPersitencyManager : PersisitencyManager
    
    // API for length unit.
    class var sharedUnitAPI: UnitAPI {
        struct Singleton {
            static let instance = UnitAPI()
        }
        return Singleton.instance
    }
    
    // Consturct
    private init() {
        self.temperatureUnitsPersitencyManager = PersisitencyManager(catetory: Category.TEMPERATURE)
        self.lengthUnitsPersitencyManager = PersisitencyManager(catetory: Category.LENGTH)
        self.volumeUnitsPersitencyManager = PersisitencyManager(catetory: Category.VOLUME)
        self.weightUnitsPersitencyManager = PersisitencyManager(catetory: Category.WEIGHT)
    }
    
    
    private func getPersitencyManagerByCategory(category : Category) -> PersisitencyManager {
        switch category {
        case .LENGTH:
            return self.lengthUnitsPersitencyManager
        case .VOLUME:
            return self.volumeUnitsPersitencyManager
        case .WEIGHT:
            return self.weightUnitsPersitencyManager
        case .TEMPERATURE:
            return self.temperatureUnitsPersitencyManager
        }
    }
    
    
    // Switch source unit to a new unit under this unit's category.
    // @param<Unit> newSourceUnit The new source unit.
    // @param<Double> value The current displayed value of the new source unit.
    // @return<Unit>
    func switchSourceUnit(newSourceUnit: Unit, value: Double) -> Unit{
        let sourceUnit = self.getPersitencyManagerByCategory(newSourceUnit.category).switchSourceUnit(newSourceUnit, value: value)
        return sourceUnit
    }
    
    // Get the sourceValue for temperature.
    // @return<Unit>
    func getSourceValueForTemperature() -> Double {
        return self.temperatureUnitsPersitencyManager.getSourceValue()
    }
    
    // Get the sourceUnit for length.
    // @return<Unit>
    func getSourceValueForLength() -> Double {
        return self.lengthUnitsPersitencyManager.getSourceValue()
    }
    
    // Get the sourceUnit for weight.
    // @return<Unit>
    func getSourceValueForWeight() -> Double {
        return self.weightUnitsPersitencyManager.getSourceValue()
    }
    
    // Get the sourceUnit for volume.
    // @return<Unit>
    func getSourceValueForVolume() -> Double {
        return self.volumeUnitsPersitencyManager.getSourceValue()
    }
    
    // Get the sourceUnit for temperature.
    // @return<Unit>
    func getSourceUnitForTemperature() -> Unit {
        return self.temperatureUnitsPersitencyManager.getSourceUnit()
    }
    
    // Get the sourceUnit for length.
    // @return<Unit>
    func getSourceUnitForLength() -> Unit {
        return self.lengthUnitsPersitencyManager.getSourceUnit()
    }
    
    // Get the sourceUnit for weight.
    // @return<Unit>
    func getSourceUnitForWeight() -> Unit {
        return self.weightUnitsPersitencyManager.getSourceUnit()
    }
    
    // Get the sourceUnit for volume.
    // @return<Unit>
    func getSourceUnitForVolume() -> Unit {
        return self.volumeUnitsPersitencyManager.getSourceUnit()
    }
    
    // Get all the units for length.
    // @return <Array<Unit>>
    func getUnitsForLength() -> [Unit] {
        return self.lengthUnitsPersitencyManager.getUnits()
    }
    
    // Get all the units for weight.
    // @return <Array<Unit>>
    func getUnitsForWeight() -> [Unit] {
        return self.weightUnitsPersitencyManager.getUnits()
    }
    
    // Get all the units for volume.
    // @return <Array<Unit>>
    func getUnitsForVolume() -> [Unit] {
        return self.volumeUnitsPersitencyManager.getUnits()
    }
    
    // Get all the units for temperature.
    // @return <Array<Unit>>
    func getUnitsForTemperature() -> [Unit] {
        return self.temperatureUnitsPersitencyManager.getUnits()
    }
    
    // Get all the target units for length.
    // @return <Array<Unit>>
    func getTaregetUnitsForLength() -> [Unit] {
        return self.lengthUnitsPersitencyManager.getTargtUnits()
    }
    
    // Get all the target units for weight.
    // @return <Array<Unit>>
    func getTargetUnitsForWeight() -> [Unit] {
        return self.weightUnitsPersitencyManager.getTargtUnits()
    }
    
    // Get all the target units for volume.
    // @return <Array<Unit>>
    func getTargetUnitsForVolume() -> [Unit] {
        return self.volumeUnitsPersitencyManager.getTargtUnits()
    }
    
    // Get all the target units for temperature.
    // @return <Array<Unit>>
    func getTargetUnitsForTemperature() -> [Unit] {
        return self.temperatureUnitsPersitencyManager.getTargtUnits()
    }
    
    // Delete a unit from target units list under that unit's category.
    // @param<Unit> unit The target unit which user want to delete.
    func deleteUnit(unit: Unit) {
        self.getPersitencyManagerByCategory(unit.category).deleteUnit(unit)
    }
    
    // Add a unit to the target units list.
    // @param<Unit> unit The target unit which user want to add.
    func addUnit(unit: Unit) {
        self.getPersitencyManagerByCategory(unit.category).addUnit(unit)
    }
    
    // Calculate the target value by providing two units.
    // @param<Unit> src The source unit.
    // @param<Unit> target The target unit.
    // @param<Double> value The current value of the source unit.
    // @return<Double>
    func convert(src: Unit, target: Unit, value: Double) -> Double {
        return self.getPersitencyManagerByCategory(src.category).convert(src, target: target, value: value)
    }
}