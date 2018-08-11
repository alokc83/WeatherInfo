//
//  WeatherInfoUITests.swift
//  WeatherInfoUITests
//
//  Created by Alok Choudhary on 6/30/18.
//  Copyright © 2018 Mt Aden LLC. All rights reserved.
//

import XCTest

class WeatherInfoUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testSettingsButton() {
        let app = XCUIApplication()
        app.buttons["button settings normal"].tap()
        app.navigationBars["Settings"].buttons["Done"].tap()
    }
    
}
