//
//  SourceUnitInputView.swift
//  easyUnit
//
//  Created by Wu on 4/2/16.
//  Copyright © 2016 Jiadong Wu. All rights reserved.
//

import UIKit

class SourceUnitInputView: UIView {
    
    @IBOutlet weak var currentUnitUILabel: UILabel!
    @IBOutlet weak var currentValueUITextField: DecimalTextField!
    @IBOutlet weak var currentUnitName: UILabel!
    
    // TODO: refactor to avoid using unit directly.
    func load(sourceUnit: Unit, value: Double) {
        currentUnitUILabel.text = sourceUnit.symbol.localized()
        currentValueUITextField.text = NSString(format:"%.\(Config.getInstance().numberOfDigits)f", value) as String
        currentUnitName.text = sourceUnit.name.localized()
        currentValueUITextField.delegate = currentValueUITextField
    }
}
