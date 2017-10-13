//
//  NetworkManger.swift
//  WeatherChallenge
//
//  Created by Felix Changoo on 10/5/17.
//  Copyright © 2017 Felix Changoo. All rights reserved.
//

import Foundation
import Alamofire

typealias weatherCompleted = (CurrentWeatherViewModel?) -> ()

struct NetworkClient {
    static let sharedInstance = NetworkClient()

    //api stuff
    static let apiKeyString = "ed05868c6c7f3c3689df1d4864c3887e"
    static let baseURLString = "http://api.openweathermap.org/data/2.5/forecast?q="
    static let app_IDString = "&appid="
    static let listKey = "list"
    
    private init() {}
    
    //method call to get JSON for the current weather of the typed in string
    //creates a CurrentWeatherViewModel via completion handler if api call is successful 
    //otherwise nil
    func getWeatherViewModelForLocation(location locationString: String, completionHandler completion: @escaping weatherCompleted ) {
        let urlForecastString = NetworkClient.baseURLString+locationString+NetworkClient.app_IDString+NetworkClient.apiKeyString
        
        Alamofire.request(urlForecastString).responseJSON { response in
            if let responseDict = response.result.value as? Dictionary<String, AnyObject> {
                
                if let firstListing = responseDict[NetworkClient.listKey] as? [Dictionary<String, AnyObject>], firstListing.count > 0 {
                    let responseDict = firstListing[0]
                    let model = CurrentWeather(with: responseDict)
                    let viewModel = CurrentWeatherViewModel(model: model)
                    
                    completion(viewModel)
                } else {
                    completion(nil)
                }
            
            } else {
                completion(nil)
            }
        }
    }
}
