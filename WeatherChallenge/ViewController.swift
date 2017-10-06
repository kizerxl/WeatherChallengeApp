//
//  ViewController.swift
//  WeatherChallenge
//
//  Created by Felix Changoo on 10/5/17.
//  Copyright © 2017 Felix Changoo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var searchField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    
    let sharedInstance = NetworkClient.sharedInstance
    var viewModel: CurrentWeatherViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchButton.layer.cornerRadius = 5.0
        
        //see what our last search was and load it
        let lastSearch = UserDefaults.standard.string(forKey: "LastSearch")
        
        if lastSearch != nil && lastSearch != "" {
            searchField.text = lastSearch
            searchButtonTapped(self)
        }
    
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //check to see if we have a search 
        let lastSearch = UserDefaults.standard.string(forKey: "LastSearch")
        searchField.text = lastSearch
    }
    
    @IBAction func searchButtonTapped(_ sender: Any) {
        guard let searchText = searchField.text else { return }
        
        sharedInstance.getWeatherViewModelForLocation(location: searchText) { [weak self] viewModel in
            guard let strongSelf = self else { return }
            
            if viewModel != nil {
                //set the last search
                UserDefaults.standard.set(searchText, forKey: "LastSearch")
                
                let controller = strongSelf.storyboard?.instantiateViewController(withIdentifier: "weatherDetail") as? WeatherDetailViewController
                controller?.viewModel = viewModel
                strongSelf.present(controller!, animated: true, completion: nil)
            } else {
                let alert = UIAlertController(title: "Search Not Found", message: "\(searchText) was not found :(", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_) in
                    strongSelf.dismiss(animated: true, completion: nil)
                }))
                
                strongSelf.present(alert, animated: true, completion: nil)
            }
        }
    }
}

