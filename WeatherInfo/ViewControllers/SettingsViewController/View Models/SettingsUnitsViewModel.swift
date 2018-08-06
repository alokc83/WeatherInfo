//
//  SettingsUnitsViewModel.swift
//  WeatherInfo
//
//  Created by Alok Choudhary on 8/4/18.
//  Copyright © 2018 Mt Aden LLC. All rights reserved.
//

import UIKit

struct SettingsUnitsViewModel {
    
    let unitsNotation: UnitsNotation
    
    var text: String {
        switch unitsNotation {
        case .imperial: return "Imperial"
        case .metric: return "Metric"
        }
    }
    
    var accessoryType: UITableViewCellAccessoryType {
        if UserDefaults.unitsNotation() == unitsNotation {
            return .checkmark
        } else {
            return .none
        }
    }
}

extension SettingsUnitsViewModel: SettingsRepresentable { }
