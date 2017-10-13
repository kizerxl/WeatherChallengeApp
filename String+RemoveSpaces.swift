//
//  String+RemoveSpaces.swift
//  WeatherChallenge
//
//  Created by Felix Changoo on 10/13/17.
//  Copyright © 2017 Felix Changoo. All rights reserved.
//

import UIKit

extension String {
    func stringWithSpacesRemoved() -> String {
        return self.components(separatedBy: .whitespaces).joined()
    }
}
