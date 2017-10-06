//
//  CurrentWeather.swift
//  WeatherChallenge
//
//  Created by Felix Changoo on 10/5/17.
//  Copyright © 2017 Felix Changoo. All rights reserved.
//

import Foundation

typealias weatherDictionary = Dictionary<String, AnyObject>

struct CurrentWeather {
    //keys 
    let mainKey = "main"
    let minTempKey = "temp_min"
    let maxTempKey = "temp_max"
    let weatherKey = "weather"
    let weatherDescriptionKey = "description"
    let weatherIconKey = "icon"
    let dateKey = "dt"
    
    var currentWeather: String = ""
    var currentWeatherDescription: String = ""
    var lowTemp: Double = 0.0
    var highTemp: Double = 0.0
    var weatherIcon: String = ""
    var day: String = ""
}

extension CurrentWeather {
    init(with weatherJSON: Dictionary<String, AnyObject>) {
        
        if let temp = weatherJSON[mainKey] as? weatherDictionary {
            
            if let min = temp[minTempKey] as? Double {
                lowTemp = min
            }
            
            if let max = temp[maxTempKey] as? Double {
                highTemp = max
            }
        }
        
        if let weather = weatherJSON[weatherKey] as? [weatherDictionary] {
            
            if let main = weather[0][mainKey] as? String {
                currentWeather = main
            }
            
            if let description = weather[0][weatherDescriptionKey] as? String {
                currentWeatherDescription = description
            }
            
            if let icon = weather[0][weatherIconKey] as? String {
                weatherIcon = icon
            }
            
        }
        
        if let weatherDate = weatherJSON[dateKey] as? Double {
            let unixConvertedDate = Date(timeIntervalSince1970: weatherDate)
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .full
            dateFormatter.dateFormat = "EEEE"
            dateFormatter.timeStyle = .none
            
            day = unixConvertedDate.dayOfTheWeek()
        }
    }
}
