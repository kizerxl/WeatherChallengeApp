//
//  WeatherChallengeTests.swift
//  WeatherChallengeTests
//
//  Created by Felix Changoo on 10/5/17.
//  Copyright © 2017 Felix Changoo. All rights reserved.
//

import XCTest
@testable import WeatherChallenge

class WeatherChallengeTests: XCTestCase {
    
    var networkClientUnderTest: NetworkClient!
    
    override func setUp() {
        super.setUp()
        
        networkClientUnderTest = NetworkClient.sharedInstance
    }
    
    func testCorrectViewModelIsCreated() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        let todayString = dateFormatter.string(from: Date()).capitalized
        
        let exampleLocation = "NewYork"
        
        networkClientUnderTest.getWeatherViewModelForLocation(location: exampleLocation) { (weatherViewModel) in
            
            XCTAssert(todayString == weatherViewModel?.day, "Day should be the same on ViewModel")
        }
    }
    
    func testGettingViewModel() {
        let ex = expectation(description: "Expecting a ViewModel that is not nil")
        let exampleLocation = "NewYork"
        
        networkClientUnderTest.getWeatherViewModelForLocation(location: exampleLocation) { (weatherViewModel) in
            
            XCTAssertNotNil(weatherViewModel)
            ex.fulfill()
        }
        
        waitForExpectations(timeout: 10) { (error) in
            if let error = error {
                XCTFail("error: \(error)")
            }
        }
    }
  
}
