//
//  SettingsUnitsViewModel.swift
//  WeatherInfoTests
//
//  Created by Alok Choudhary on 8/4/18.
//  Copyright © 2018 Mt Aden LLC. All rights reserved.
//

import XCTest
@testable import WeatherInfo

class SettingsUnitsViewModelTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
        UserDefaults.standard.removeObject(forKey: UserDefaultsKeys.unitsNotation)
    }
    
    func testTest_Imperial() {
        let viewModel = SettingsUnitsViewModel(unitsNotation: .imperial)
        
        XCTAssertEqual(viewModel.text, "Imperial")
    }
    
    func testTest_Metric() {
        let viewModel = SettingsUnitsViewModel(unitsNotation: .metric)
        
        XCTAssertEqual(viewModel.text, "Metric")
    }
    
    // MARK: - Tests for Accessory Type
    
    func testAccessoryType_Imperial_Imperial() {
        let unitsNotation: UnitsNotation = .imperial
        UserDefaults.standard.set(unitsNotation.rawValue, forKey: UserDefaultsKeys.unitsNotation)
        
        let viewModel = SettingsUnitsViewModel(unitsNotation: .imperial)
        
        XCTAssertEqual(viewModel.accessoryType, UITableViewCellAccessoryType.checkmark)
    }
    
    
    func testAccessoryType_Imperial_Metric() {
        let unitsNotation: UnitsNotation = .imperial
        UserDefaults.standard.set(unitsNotation.rawValue, forKey: UserDefaultsKeys.unitsNotation)
        
        let viewModel = SettingsUnitsViewModel(unitsNotation: .metric)
        
        XCTAssertEqual(viewModel.accessoryType, UITableViewCellAccessoryType.none)
    }
    
    func testAccessoryType_Metric_Imperial() {
        let unitsNotation: UnitsNotation = .metric
        UserDefaults.standard.set(unitsNotation.rawValue, forKey: UserDefaultsKeys.unitsNotation)
        
        let viewModel = SettingsUnitsViewModel(unitsNotation: .imperial)
        
        XCTAssertEqual(viewModel.accessoryType, UITableViewCellAccessoryType.none)
    }
    
    
    func testAccessoryType_Metric_Metric() {
        let unitsNotation: UnitsNotation = .metric
        UserDefaults.standard.set(unitsNotation.rawValue, forKey: UserDefaultsKeys.unitsNotation)
        
        let viewModel = SettingsUnitsViewModel(unitsNotation: .metric)
        
        XCTAssertEqual(viewModel.accessoryType, UITableViewCellAccessoryType.checkmark)
    }
}
