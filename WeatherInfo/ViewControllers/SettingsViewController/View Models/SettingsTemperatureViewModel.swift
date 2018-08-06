//
//  SettingsTemperatureViewModel.swift
//  WeatherInfo
//
//  Created by Alok Choudhary on 8/4/18.
//  Copyright © 2018 Mt Aden LLC. All rights reserved.
//

import UIKit

struct SettingsTemperatureViewModel {
    let temperatureNotation: TemperatureNotation
    
    var text: String {
        switch temperatureNotation {
        case .celsius: return "Celcius (°C)"
        case .fahrenheit: return "Fahrenheit (°F)"
        }
    }
    
    var accessoryType: UITableViewCellAccessoryType {
        if UserDefaults.temperatureNotation() == temperatureNotation {
            return .checkmark
        } else {
            return .none
        }
    }
}

extension SettingsTemperatureViewModel: SettingsRepresentable { }
