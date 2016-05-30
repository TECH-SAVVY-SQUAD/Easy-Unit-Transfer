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
    
    private init() {
        super.init(category: Category.VOLUME, sourceUnit: Units.volumeUnits.first!, sourceValue: 1, targetUnits: Units.volumeUnits.filter({$0.symbol == "Gal-US"}))
    }
    
    static func getInstance() -> VolumeUnitConverter {
        return volumeUnitConverter
    }
}