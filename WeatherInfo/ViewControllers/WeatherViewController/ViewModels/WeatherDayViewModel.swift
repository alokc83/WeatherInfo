//
//  WeatherDayViewModel.swift
//  WeatherInfo
//
//  Created by Alok Choudhary on 8/4/18.
//  Copyright © 2018 Mt Aden LLC. All rights reserved.
//

import UIKit

struct WeatherDayViewModel {
    let weatherDayData: WeatherDayData
    
    private let dateFormatter = DateFormatter()
    private let dayFormatter = DateFormatter()
    
    var day: String {
        dayFormatter.dateFormat = "EEEE"
        return dayFormatter.string(from: weatherDayData.time)
    }
    
    var date: String {
        dateFormatter.dateFormat = "MMMM d"
        return dateFormatter.string(from: weatherDayData.time)
    }
    
    var temperature: String {
        let min = format(temperature: weatherDayData.temperatureMin)
        let max = format(temperature: weatherDayData.temperatureMax)
        return "\(min) - \(max)"
    }
    
    var windSpeed: String {
        let windSpeed = weatherDayData.windSpeed

        switch UserDefaults.unitsNotation() {
        case .imperial: return String(format: "%.f mph", windSpeed)
        case .metric: return String(format: "%.f kmph", windSpeed.toKPH())
        }
    }
    
    var image: UIImage? {
        return UIImage.imageForIcon(withName: weatherDayData.icon)
    }
}

extension WeatherDayViewModel {
    private func format(temperature: Double) -> String {
        switch UserDefaults.temperatureNotation() {
        case .fahrenheit: return String(format: "%0f F", temperature)
        case .celsius: return String(format: "%0f C", temperature.toCelcius())
        }
    }
}

extension WeatherDayViewModel: WeatherDayRepresentable { }
