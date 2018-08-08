//
//  UIImage+Extension.swift
//  WeatherInfo
//
//  Created by Alok Choudhary on 8/3/18.
//  Copyright © 2018 Mt Aden LLC. All rights reserved.
//

import UIKit

extension UIImage {
    
    class func imageForIcon(withName name: String) -> UIImage? {
        switch name {
        case "clear-day", "clear-night", "rain", "snow", "sleet": return UIImage(named: name)
        case "wind", "cloudy", "partly-cloudy-day", "partly-cloudy-night": return UIImage(named: "cloudy")
        default: return UIImage(named: "clear-day")
        }
    }
    
    class func imageForDayBackground(withName name: String) -> UIImage? {
        switch name {
        case "clear-day": return nil
        case "clear-night": return nil
        case "rain": return nil
        case "snow": return nil
        case "sleet": return nil
        case "wind", "cloudy", "partly-cloudy-day", "partly-cloudy-night": return nil
        default: return nil
        }
    }
    
}
