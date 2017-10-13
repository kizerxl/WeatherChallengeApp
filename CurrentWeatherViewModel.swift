//
//  CurrentWeatherViewModel.swift
//  WeatherChallenge
//
//  Created by Felix Changoo on 10/5/17.
//  Copyright © 2017 Felix Changoo. All rights reserved.
//

import Foundation

//Utilizing MVVM we use a ViewModel to encapsulate a CurrentWeather model
struct CurrentWeatherViewModel {
    var currentWeather: String
    var currentWeatherDescription: String
    var lowTemp: Double
    var highTemp: Double
    var weatherIcon: String
    var day: String
}

extension CurrentWeatherViewModel {
    init(model: CurrentWeather) {
        self.currentWeather = model.currentWeather
        self.currentWeatherDescription = model.currentWeatherDescription
        self.lowTemp = model.lowTemp.FarenheitTemp().rounded()
        self.highTemp = model.highTemp.FarenheitTemp().rounded()
        self.weatherIcon = model.weatherIcon
        self.day = model.day
    }
}
