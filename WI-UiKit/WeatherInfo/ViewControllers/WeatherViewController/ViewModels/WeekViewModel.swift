//
//  WeekViewModel.swift
//  WeatherInfo
//
//  Created by Alok Choudhary on 8/4/18.
//  Copyright © 2018 Mt Aden LLC. All rights reserved.
//

import UIKit

struct WeekViewModel {
    let weatherData: [WeatherDayData]
    
    var numberOfSections: Int {
        return 1
    }
    
    var numberOfRowsInSection: Int {
        return weatherData.count
    }
    
    func viewModel(for index: Int) -> WeatherDayViewModel {
        return WeatherDayViewModel(weatherDayData: weatherData[index])
    }
    
}
