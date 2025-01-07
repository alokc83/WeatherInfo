//
//  Item.swift
//  WeatherInfo
//
//  Created by Alok Choudhary on 1/6/25.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
