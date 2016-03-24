//
//  ShoeSizeConverter.swift
//  easyUnit
//
//  Created by Wu on 2/27/16.
//  Copyright © 2016 Jiadong Wu. All rights reserved.
//

import Foundation

class shoeSize{
    private(set) var symbol:        String = ""
    private(set) var description:   String = ""
    private(set) var type:      Int = 1
    private(set) var country:       String = "" //to do
    
    init(symbol: String, type: Int, description: String) {
        self.symbol = symbol
        self.type = type
        self.description = description
    }
}

class ShoeSizeConverter {
    static var shoeSizeConverter = ShoeSizeConverter()
    
    private var currentValue = 1.0
    private var currentIndexInDic = 0
    private var currentUnit = "CN"
    private var currentType = 1
    private var shoeSizeDicForMen = [String: [String]]()
    private var shoeSizeDicForWomen = [String: [String]]()
    private var shoeSizeDicForChildren = [String: [String]]()
    private(set) var currentDisplayUnit = [String]()
    
    private init(){
        currentDisplayUnit = ["US","UK","JP","CN"]
        shoeSizeDicForMen["US"] = ["6.0","6.5","7.0","7.5","8.0","8.5","9.0","9.5","10.0","10.5","11","11.5","12","12.5","13"]
        shoeSizeDicForMen["CN"] = ["38","39","40","41","42","43","44","45","46","47","48","49","50","51","52"]
        shoeSizeDicForMen["JP"] = ["240","245","250","255","260","265","270","275","280","285","290","295","300","305","310"]
        shoeSizeDicForMen["UK"] = ["5.5","6.0","6.5","7.0","7.5","8.0","8.5","9.0","9.5","10","10.5","11","11.5","12","12.5"]
        
    }
    
    static func getInstance() -> ShoeSizeConverter{
        return shoeSizeConverter
    }
    
    func setShoeSize(input: Double){
        if(!isValueInput(input)){
            return
        }
        currentValue = input
        if(currentType == 1){
            switch currentUnit {
            case "US":
                currentIndexInDic = Int((input - 6)*2)
            case "CN":
                currentIndexInDic = Int(input - 38)
            case "UK":
                currentIndexInDic = Int((input - 5.5)*2)
            case "JP":
                currentIndexInDic = Int((input-240)/5)
            default:
                currentIndexInDic = 0
            }
        }else if(currentType == 2){
            switch currentUnit {
            case "US":
                currentIndexInDic = Int((input - 5.5)*2)
            case "CN":
                currentIndexInDic = Int(input - 34)
            case "UK":
                currentIndexInDic = Int((input - 4.0)*2)
            case "JP":
                currentIndexInDic = Int((input-220)/5)
            default:
                currentIndexInDic = 0
            }
        }else if(currentType == 3) {
            switch currentUnit {
            case "US":
                currentIndexInDic = Int((input - 6)*2)
            case "CN":
                currentIndexInDic = Int(input - 38)
            case "UK":
                currentIndexInDic = Int((input - 5.5)*2)
            case "JP":
                currentIndexInDic = Int((input-240)/5)
            default:
                currentIndexInDic = 0
            }
        }
    }
    
    func getShoeSize(symbol: String) -> String{
        var ret = ""
        if(currentType == 1){
            if let array = shoeSizeDicForMen[symbol] {
                ret = array[currentIndexInDic]
            }
        }else if(currentType == 2){
            if let array = shoeSizeDicForWomen[symbol] {
                ret = array[currentIndexInDic]
            }
        }else if(currentType == 3) {
            if let array = shoeSizeDicForChildren[symbol] {
                ret = array[currentIndexInDic]
            }
        }
        return ret
    }
    
    func setType(type: Int) {
        currentType = type
    }
    
    func getType() -> String {
        switch currentType {
        case 1:
            return "Men"
        case 2:
            return "Women"
        case 3:
            return "Children"
        default:
            return ""
        }
    }
    
    func switchUnit(unitSymbol: String) {
        self.currentUnit = unitSymbol
    }
    
    func getDisplayUnitArray() -> [String] {
        var ret = [String]()
        for title in currentDisplayUnit {
            if title != currentUnit {
                ret.append(title)
            }
        }
        return ret
    }
    
    func isValueInput(number:Double) -> Bool{
        var ret: Bool = false
        if(currentType == 1){
            switch currentUnit {
            case "US":
                ret = (number>=6.0)&&(number<=13.0)
            case "CN":
                ret = (number>=38)&&(number<=52)
            case "UK":
                ret = (number>=5.5)&&(number<=12.5)
            case "JP":
                ret = (number>=240)&&(number<=310)
            default:
                ret = false
            }
        }else if(currentType == 2){
            switch currentUnit {
            case "US":
                ret = (number>=5.0)&&(number<=9.0)
            case "CN":
                ret = (number>=34)&&(number<=42)
            case "UK":
                ret = (number>=4.0)&&(number<=8.0)
            case "JP":
                ret = (number>=220)&&(number<=260)
            default:
                ret = false

            }
        }else if(currentType == 3) {
            switch currentUnit {
            case "US":
                ret = (number>=6.0)&&(number<=10.0)
            case "CN":
                ret = (number>=38)&&(number<=46)
            case "UK":
                ret = (number>=5.5)&&(number<=9.5)
            case "JP":
                ret = (number>=240)&&(number<=280)
            default:
                ret = false
            }
        }
        return ret
    }
}