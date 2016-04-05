//
//  DecimalTextField.swift
//  easyUnit
//
//  Created by Wu on 3/26/16.
//  Copyright © 2016 Jiadong Wu. All rights reserved.
//

import UIKit

class DecimalTextField: UITextField,UITextFieldDelegate {

    
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        switch string {
        case "0","1","2","3","4","5","6","7","8","9":
            return true
        case ".":
            let currentString = textField.text!
            var decimalCount = 0;
            for character in currentString.characters {
                if character == "." {
                    decimalCount += 1
                }
            }
            if decimalCount == 0 {
                return true
            } else {
                return false
            }
        default:
            let array = Array(arrayLiteral: string)
            if array.count > 0 {
                return true
            }
            return false
        }
    }
}
