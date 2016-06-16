//
//  StringExtension.swift
//  easyUnit
//
//  Created by Wu on 6/10/16.
//  Copyright © 2016 Jiadong Wu. All rights reserved.
//

import Foundation
extension String {
    
    func localized() -> String {
        let config = Config.getInstance()
        let path = NSBundle.mainBundle().pathForResource(config.language.getLocalizableTag(), ofType: "lproj")
        let bundle = NSBundle(path: path!)
        return NSLocalizedString(self, tableName: nil, bundle: bundle!, value: "", comment: "")
    }
}