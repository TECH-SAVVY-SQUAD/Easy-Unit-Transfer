//
//  TemperatureUnitConverterTest.swift
//  easyUnit
//
//  Created by Wu on 3/19/16.
//  Copyright © 2016 Jiadong Wu. All rights reserved.
//

import XCTest
@testable import easyUnit

class TemperatureUnitConverterTest: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testFromCelsiusToCelsius() {
        XCTAssert(TemperatureUnitConverter.convert("˚C", to: "˚C", value: 20) == 20, "Pass")
    }
    
    func testFromFahrenheitToFahrenheit() {
        XCTAssert(TemperatureUnitConverter.convert("˚F", to: "˚F", value: 20) == 20, "Pass")
    }
    
    func testFromCelsiusToFahrenheit() {
        XCTAssert(TemperatureUnitConverter.convert("˚C", to: "˚F", value: 5) == 41, "Pass")
    }
    
    func testFromFahrenheitToCelsius() {
        XCTAssert(TemperatureUnitConverter.convert("˚F", to: "˚C", value: 32) == 0, "Pass")
    }
    
    func testUnitsListSize() {
        XCTAssert(TemperatureUnitConverter.getUnitsList("F").count == 1, "Pass")
    }

}
