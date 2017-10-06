//
//  Float+kelvinToFarenheit.swift
//  WeatherChallenge
//
//  Created by Felix Changoo on 10/5/17.
//  Copyright © 2017 Felix Changoo. All rights reserved.
//

import Foundation

extension Double {
    
    func FarenheitTemp() -> Double {
        return (self * (9/5) - 459.67)
    }
}
