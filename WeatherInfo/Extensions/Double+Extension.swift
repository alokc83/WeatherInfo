//
//  Double+Extension.swift
//  WeatherInfo
//
//  Created by Alok Choudhary on 8/3/18.
//  Copyright © 2018 Mt Aden LLC. All rights reserved.
//

import Foundation

extension Double {

    func toCelcius() -> Double {
        return ((self - 32.0) / 1.8)
    }

    func toKPH() -> Double {
        return (self * 1.609344)
    }

}
