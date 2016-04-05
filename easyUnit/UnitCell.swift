//
//  UnitCell.swift
//  easyUnit
//
//  Created by Wu on 3/25/16.
//  Copyright © 2016 Jiadong Wu. All rights reserved.
//

import UIKit

class UnitCell: UITableViewCell {
    
    @IBOutlet weak var cellValue: UILabel!
    @IBOutlet weak var cellTitle: UILabel!
    @IBOutlet weak var cellUnitName: UILabel!
    @IBOutlet weak var cellUnitCountryFlag: UIImageView!
    var unit: Unit = Unit()
    var value: Double = 1.0
    
    func loadCell(unit: Unit, value: Double) {
        cellTitle.text = unit.symbol
        cellValue.text = NSString(format:Config.numberOfDigitString, value) as String
        cellUnitName.text = unit.name
        cellUnitCountryFlag.image = UIImage(named: unit.country)
        self.unit = unit
        self.value = value
    }
}