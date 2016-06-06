//
//  Config.swift
//  easyUnit
//
//  Created by Wu on 3/24/16.
//  Copyright © 2016 Jiadong Wu. All rights reserved.
//

import Foundation

class Config {
    // Private error type.
    private enum PlistError: ErrorType {
        case FileNotWritten
        case FileDoesNotExist
        case FileCopyError
        func toString() -> String {
            switch self {
            case .FileDoesNotExist:
                return "No such file."
            case .FileNotWritten:
                return "File not written successfully."
            case .FileCopyError:
                return "File copy error."
            }
        }
    }
    static private var ConfigInstance = Config()
    
    // Sepecfiy the precision of unit values.
    var numberOfDigits = 1
    // Key in the plist file for numberOfDigit value.
    let NUMBER_OF_DIGITS_KEY = "numberOfDigits"
    // Specifiy the language used in this app.
    var language = Language.EN
    // Key in the plist file for language value.
    let LANGUAGE_KEY = "language"
    
    private let fileManager = NSFileManager.defaultManager()
    
    private init(){}
    
    /**
    * Get the single instance of Config class.
    */
    static func getInstance() -> Config {
        return ConfigInstance
    }
    
    
    /**
    * Read from plist file to initilize configuration.
    * Called when this app is initialized.
    */
    func configInit() throws{
        let filename = getDocumentsDirectory().stringByAppendingPathComponent("setting.plist")
        var resdict : NSMutableDictionary?
        //check if file exists
        if(!fileManager.fileExistsAtPath(filename)) {
            // If it doesn't, copy it from the default file in the Bundle
            if let bundlePath = NSBundle.mainBundle().pathForResource("setting", ofType: "plist") {
                resdict = NSMutableDictionary(contentsOfFile: bundlePath)
                do {
                    try fileManager.copyItemAtPath(bundlePath, toPath: filename)
                }catch _ {
                    throw PlistError.FileCopyError
                }
            } else {
                throw PlistError.FileDoesNotExist
            }
        }
        
        resdict = NSMutableDictionary(contentsOfFile: filename)
        if let dict = resdict {
            if let numberOfDigits = dict[self.NUMBER_OF_DIGITS_KEY]{
                self.numberOfDigits = numberOfDigits as! Int
            }
            if let language = Language(rawValue: dict[self.LANGUAGE_KEY] as! Int) {
                self.language = language
            }
        }
    }
    
    /**
    * Update current setting, writing to the plist file.
    * Called when the app enters background.
    */
    func updateSettings() throws{
        let filename = getDocumentsDirectory().stringByAppendingPathComponent("setting.plist")
        let dict = NSMutableDictionary()
        dict.setValue(self.numberOfDigits, forKey: self.NUMBER_OF_DIGITS_KEY)
        dict.setValue(self.language.rawValue, forKey: self.LANGUAGE_KEY)
        if fileManager.fileExistsAtPath(filename) {
            if !dict.writeToFile(filename, atomically: true) {
                throw PlistError.FileNotWritten
            }
        } else {
            throw PlistError.FileDoesNotExist
        }
    }
    
    func getDocumentsDirectory() -> NSString {
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }
}

enum Language: Int {
    case EN = 0
    case CN
    func getString() -> String {
        switch self {
        case .CN:
            return "Chinese"
        case .EN:
            return "English"
        }
    }
}