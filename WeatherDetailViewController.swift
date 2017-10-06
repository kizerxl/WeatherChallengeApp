//
//  WeatherDetailViewController.swift
//  WeatherChallenge
//
//  Created by Felix Changoo on 10/6/17.
//  Copyright © 2017 Felix Changoo. All rights reserved.
//

import UIKit

class WeatherDetailViewController: UIViewController {

    var viewModel: CurrentWeatherViewModel?
    
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var weatherDescripLabel: UILabel!
    @IBOutlet weak var longWeatherDescripLabel: UILabel!
    @IBOutlet weak var highTempLbl: UILabel!
    @IBOutlet weak var lowTempLbl: UILabel!
    
    struct ImageStrings {
        static let baseURLString = "http://openweathermap.org/img/w/"
        static let imageExtension = ".png"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
    }
    
    func configureView() {
        dayLabel.text = viewModel?.day
        weatherDescripLabel.text = viewModel?.currentWeather
        longWeatherDescripLabel.text = viewModel?.currentWeatherDescription
        
        if let highTemp = viewModel?.highTemp, let lowTemp = viewModel?.lowTemp {
            highTempLbl.text = "\(highTemp)"
            lowTempLbl.text = "\(lowTemp)"
        }
        
        if let iconString = viewModel?.weatherIcon {
            let urlString = ImageStrings.baseURLString+iconString+ImageStrings.imageExtension
            
            weatherImageView.getImageUsingCacheWithURLString(urlString, placeholder: #imageLiteral(resourceName: "Missing"), completionHandler: { _ in})
        }
        
    }

    @IBAction func xTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
