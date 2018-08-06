//
//  SettingsTimeViewModelTests.swift
//  WeatherInfoTests
//
//  Created by Alok Choudhary on 8/4/18.
//  Copyright © 2018 Mt Aden LLC. All rights reserved.
//

import XCTest
@testable import WeatherInfo

class SettingsTimeViewModelTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        
    }
    
    override func tearDown() {
        super.tearDown()
        UserDefaults.standard.removeObject(forKey: UserDefaultsKeys.timeNotation)
    }
    
    func testText_TwelveHour() {
        let viewModel = SettingsTimeViewModel(timeNotation: .twelveHour)
        XCTAssertEqual(viewModel.text, "12 Hour")
    }
    
    func testText_TwentyHour() {
        let viewModel = SettingsTimeViewModel(timeNotation: .twentyFourHour)
        XCTAssertEqual(viewModel.text, "24 Hour")
    }
    
    func testAccessoryType_TwelveHour_TwelveHour() {
        let timeNotation: TimeNotation = .twelveHour
        UserDefaults.standard.set(timeNotation.rawValue, forKey: UserDefaultsKeys.timeNotation)
        
        let viewModel = SettingsTimeViewModel(timeNotation: .twelveHour)
        
        XCTAssertEqual(viewModel.accessoryType, UITableViewCellAccessoryType.checkmark)
    }
    
    func testAccessoryType_TwelveHour_TwentyFourHour() {
        let timeNotation: TimeNotation = .twelveHour
        UserDefaults.standard.set(timeNotation.rawValue, forKey: UserDefaultsKeys.timeNotation)
        
        let viewModel = SettingsTimeViewModel(timeNotation: .twentyFourHour)
        
        XCTAssertEqual(viewModel.accessoryType, UITableViewCellAccessoryType.none)
    }
    
    func testAccessoryType_TwentyFourHour_TwelveHour() {
        let timeNotation: TimeNotation = .twentyFourHour
        UserDefaults.standard.set(timeNotation.rawValue, forKey: UserDefaultsKeys.timeNotation)
        
        let viewModel = SettingsTimeViewModel(timeNotation: .twelveHour)
        
        XCTAssertEqual(viewModel.accessoryType, UITableViewCellAccessoryType.none)
    }
    
    func testAccessoryType_TwentyFourHour_TwentyFourHour() {
        let timeNotation: TimeNotation = .twentyFourHour
        UserDefaults.standard.set(timeNotation.rawValue, forKey: UserDefaultsKeys.timeNotation)
        
        let viewModel = SettingsTimeViewModel(timeNotation: .twentyFourHour)
        
        XCTAssertEqual(viewModel.accessoryType, UITableViewCellAccessoryType.checkmark)
    }
    
}
