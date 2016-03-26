//
//  VolumeUnitConverter.swift
//  easyUnit
//
//  Created by Wu on 3/25/16.
//  Copyright © 2016 Jiadong Wu. All rights reserved.
//

import Foundation

class VolumeUnitConverter: Converter {
    static private var volumeUnitConverter = VolumeUnitConverter()
    
    private override init() {
        super.init()
        // TODO
        // Check first is vaild or not
        super.sourceUnit = Units.volumeUnits.first!
        super.targetUnits = Units.volumeUnits.filter({$0.symbol != "l"})
    }
    
    static func getInstance() -> VolumeUnitConverter {
        return volumeUnitConverter
    }
}