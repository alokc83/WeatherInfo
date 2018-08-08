//
//  UIImage+Extension.swift
//  WeatherInfo
//
//  Created by Alok Choudhary on 8/3/18.
//  Copyright © 2018 Mt Aden LLC. All rights reserved.
//

import UIKit
import Foundation

protocol EnumStringConvertible {
    var rawValue: String { get }
    func string() -> String
}

extension EnumStringConvertible {
    func string() -> String {
        return self.rawValue
    }
}

enum Weather: String, EnumStringConvertible {
    case clearDay = "Sunny"
    case clearNight = "Clear"
    case rain = "Rain"
    case snow = "Snow"
    case sleet = "Sleet"
    case wind = "Wind"
    case cloudyDay = "CloudyDay"
    case cloudyNight = "CloudyNight"
    case cloudy = "Cloudy"
    case partlyCloudyDay = "PartlyCloudyDay"
    case partlyCloudyNight = "PartlyCloudyNight"
}

enum SceneTime: String, EnumStringConvertible {
    case day = "Sun-day"
    case night = "Moon-night"
    case evening = "Bloody-evening"
}

extension UIImage {
    class func imageForIcon(withName name: String) -> UIImage? {
        switch name {
        case "clear-day": return UIImage(named: Weather.clearDay.string())
        case "clear-night": return UIImage(named: Weather.clearNight.string())
        case "rain": return UIImage(named: Weather.rain.string())
        case "snow": return UIImage(named: Weather.snow.string())
        case "sleet": return UIImage(named: Weather.sleet.string())
        case "wind": return UIImage(named: Weather.wind.string())
        case "cloudy": return UIImage(named: Weather.cloudy.string())
        case "partly-cloudy-day": return UIImage(named: Weather.partlyCloudyDay.string())
        case "partly-cloudy-night": return UIImage(named: Weather.partlyCloudyNight.string())

        default: return UIImage(named: "clear-day")
        }
    }
    
    class func imageForDayBackground(withName name: String) -> UIImage? {
        switch name {
        case "clear-day", "partly-cloudy-day": return UIImage(named: SceneTime.day.string())
        case "clear-night", "partly-cloudy-night":
            return UIImage(named: SceneTime.night.string())
        default: return UIImage(named: SceneTime.day.string())
        }
    }
    
}
