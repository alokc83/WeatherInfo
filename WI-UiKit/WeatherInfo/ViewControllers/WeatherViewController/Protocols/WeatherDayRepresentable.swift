//
//  WeatherDayRepresentable.swift
//  WeatherInfo
//
//  Created by Alok Choudhary on 8/4/18.
//  Copyright © 2018 Mt Aden LLC. All rights reserved.
//

import UIKit

protocol WeatherDayRepresentable {
    var day: String { get }
    var date: String { get }
    var windSpeed: String { get }
    var temperature: String { get }
    var image: UIImage? { get }
}
