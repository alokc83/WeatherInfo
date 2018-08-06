//
//  DayViewModel.swift
//  Cloudy
//
//  Created by Alok Choudhary on 8/3/18.
//  Copyright © 2018 Cocoacasts. All rights reserved.
//

import UIKit

struct DayViewModel {
    let weatherData: WeatherData
    
    private let dateFormatter = DateFormatter()
    private let timeFormatter = DateFormatter()
    
    var date: String {
        // Initialize Date Formatter
        let dateFormatter = DateFormatter()
        // Configure Date Formatter
        dateFormatter.dateFormat = "EEE, MMMM d"
        return dateFormatter.string(from: weatherData.time)
    }
    
    var time: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = UserDefaults.timeNotation().timeFormat
        return dateFormatter.string(from: weatherData.time)
    }
    
    var summary: String {
        return weatherData.summary
    }
    
    var temperature: String {
        let temperature = weatherData.temperature
        
        switch UserDefaults.temperatureNotation() {
        case .fahrenheit:
            return String(format: "%.1f °F", temperature)
        case .celsius:
            return String(format: "%.1f °C", temperature.toCelcius())
        }
    }
    
    var windSpeed: String {
        let windSpeed = weatherData.windSpeed
        
        switch UserDefaults.unitsNotation() {
        case .imperial:
            return String(format: "%.f MPH", windSpeed)
        case .metric:
            return String(format: "%.f KPH", windSpeed.toKPH())
        }
    }
    
    var image: UIImage? {
        return UIImage.imageForIcon(withName: weatherData.icon)
    }
}
