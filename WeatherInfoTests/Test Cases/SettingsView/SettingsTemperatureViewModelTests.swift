//
//  SettingsTemperatureViewModelTests.swift
//  WeatherInfoTests
//
//  Created by Alok Choudhary on 8/4/18.
//  Copyright © 2018 Mt Aden LLC. All rights reserved.
//

import XCTest
@testable import WeatherInfo

class SettingsTemperatureViewModelTests: XCTestCase {
    
    // MARK: - Set Up & Tear Down
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
        UserDefaults.standard.removeObject(forKey: UserDefaultsKeys.temperatureNotation)
    }
    
    // MARK: - Tests for Text
    
    func testText_Fahrenheit() {
        let viewModel = SettingsTemperatureViewModel(temperatureNotation: .fahrenheit)
        
        XCTAssertEqual(viewModel.text, "Fahrenheit (°F)")
    }
    
    func testText_Celsius() {
        let viewModel = SettingsTemperatureViewModel(temperatureNotation: .celsius)
        
        XCTAssertEqual(viewModel.text, "Celcius (°C)")
    }
    
    // MARK: - Tests for Accessory Type
    
    func testAccessoryType_Fahrenheit_Fahrenheit() {
        let temperatureNotation: TemperatureNotation = .fahrenheit
        UserDefaults.standard.set(temperatureNotation.rawValue, forKey: UserDefaultsKeys.temperatureNotation)
        
        let viewModel = SettingsTemperatureViewModel(temperatureNotation: .fahrenheit)
        
        XCTAssertEqual(viewModel.accessoryType, UITableViewCell.AccessoryType.checkmark)
    }
    
    func testAccessoryType_Fahrenheit_Celsius() {
        let temperatureNotation: TemperatureNotation = .fahrenheit
        UserDefaults.standard.set(temperatureNotation.rawValue, forKey: UserDefaultsKeys.temperatureNotation)
        
        let viewModel = SettingsTemperatureViewModel(temperatureNotation: .celsius)
        
        XCTAssertEqual(viewModel.accessoryType, UITableViewCell.AccessoryType.none)
    }
    
    func testAccessoryType_Celsius_Fahrenheit() {
        let temperatureNotation: TemperatureNotation = .celsius
        UserDefaults.standard.set(temperatureNotation.rawValue, forKey: UserDefaultsKeys.temperatureNotation)
        
        let viewModel = SettingsTemperatureViewModel(temperatureNotation: .fahrenheit)
        
        XCTAssertEqual(viewModel.accessoryType, UITableViewCell.AccessoryType.none)
    }
    
    func testAccessoryType_Celsius_Celsius() {
        let temperatureNotation: TemperatureNotation = .celsius
        UserDefaults.standard.set(temperatureNotation.rawValue, forKey: UserDefaultsKeys.temperatureNotation)
        
        let viewModel = SettingsTemperatureViewModel(temperatureNotation: .celsius)
        
        XCTAssertEqual(viewModel.accessoryType, UITableViewCell.AccessoryType.checkmark)
    }
    
}
