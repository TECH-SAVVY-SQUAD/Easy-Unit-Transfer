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
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testFromCelsiusToCelsius() {
        XCTAssert(TemperatureUnitConverter.convert("Celsius", to: "Celsius", value: 20) == 20, "Pass")
    }
}
