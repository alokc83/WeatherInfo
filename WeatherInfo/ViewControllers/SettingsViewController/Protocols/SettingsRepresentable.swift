//
//  SettingsRepresentable.swift
//  WeatherInfo
//
//  Created by Alok Choudhary on 8/4/18.
//  Copyright © 2018 Mt Aden LLC. All rights reserved.
//

import UIKit

protocol SettingsRepresentable {
    var text: String { get }
    var accessoryType: UITableViewCell.AccessoryType { get }
}
