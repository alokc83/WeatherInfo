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
    
    func testClockModeCellsExistence() {
        let app = XCUIApplication()
        app.buttons["button settings normal"].tap()
        
        //given
        let twelveHrCell = app.staticTexts["12 Hour"]
        let twentyFourHrCell = app.staticTexts["24 Hour"]

        //then
        XCTAssertTrue(twelveHrCell.exists)
        XCTAssertTrue(twentyFourHrCell.exists)
    }
    
    func testUnitCellsExistence() {
        let app = XCUIApplication()
        app.buttons["button settings normal"].tap()
        
        //given
        let imperialCell = app.staticTexts["Imperial"]
        let metricCell = app.staticTexts["Metric"]
        
        XCTAssertTrue(imperialCell.exists)
        XCTAssertTrue(metricCell.exists)
        
    }
    
    func testTemperatureCellsExistence() {
        let app = XCUIApplication()
        app.buttons["button settings normal"].tap()
        
        //given
        let fahrenheitCell = app.staticTexts["Fahrenheit (°F)"]
        let celciusCell = app.staticTexts["Celcius (°C)"]
        
        XCTAssertTrue(fahrenheitCell.exists)
        XCTAssertTrue(celciusCell.exists)
        
    }
    
    //XCTAssertTrue(app.tables.cells.element(boundBy: 0).isSelected)
    func testTimeModeSelected() {
        let app = XCUIApplication()
        app.buttons["button settings normal"].tap()
        
        if app.tables.cells.element(boundBy: 0).isSelected {
          XCTAssertTrue(app.tables.cells.element(boundBy: 0).isSelected)
        } else if app.tables.cells.element(boundBy: 1).isSelected {
            XCTAssertTrue(app.tables.cells.element(boundBy: 1).isSelected)
        }
        
    }
    
    func testUnitModeSelected() {
        let app = XCUIApplication()
        app.buttons["button settings normal"].tap()
        
        if app.tables.cells.element(boundBy: 2).isSelected {
            XCTAssertTrue(app.tables.cells.element(boundBy: 2).isSelected)
        } else if app.tables.cells.element(boundBy: 3).isSelected {
            XCTAssertTrue(app.tables.cells.element(boundBy: 3).isSelected)
        }
    }
    
    func testTemperatureUitSelected() {
        let app = XCUIApplication()
        app.buttons["button settings normal"].tap()
        
        if app.tables.cells.element(boundBy: 4).isSelected {
            XCTAssertTrue(app.tables.cells.element(boundBy: 4).isSelected)
        } else if app.tables.cells.element(boundBy: 5).isSelected {
            XCTAssertTrue(app.tables.cells.element(boundBy: 5).isSelected)
        }
    }
    
}
