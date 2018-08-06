//
//  SettingsTimeViewModel.swift
//  WeatherInfo
//
//  Created by Alok Choudhary on 8/4/18.
//  Copyright © 2018 Mt Aden LLC. All rights reserved.
//

import UIKit

struct SettingsTimeViewModel {
    
    let timeNotation: TimeNotation
    
    var text: String {
        switch timeNotation {
        case .twelveHour: return "12 Hour"
        case .twentyFourHour: return "24 Hour"
        }
    }
    
    var accessoryType: UITableViewCellAccessoryType {
        if UserDefaults.timeNotation() == timeNotation {
            return .checkmark
        } else {
            return .none
        }
    }
}

extension SettingsTimeViewModel: SettingsRepresentable { }
