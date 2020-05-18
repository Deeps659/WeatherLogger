//
//  WeatherViewModel.swift
//  WeatherLogger
//
//  Created by DEEPALI MAHESHWARI on 10/03/20.
//  Copyright © 2020 DEEPALI MAHESHWARI. All rights reserved.
//

import Foundation

struct WeatherLoggerViewModel {
    
    func addWeatherViewModel(_ vm: WeatherModel, dateString : String) {
        var weatherViewModels = [[String : Any]]()
        let userDefaults = UserDefaults.standard
        let dict = ["temp":vm.currentTemperature.temperature, "city":vm.name ,"date": dateString,"humidity": vm.currentTemperature.humidity, "tempMin":vm.currentTemperature.temperatureMin, "tempMax":vm.currentTemperature.temperatureMax] as [String : Any]
        if var weatherVMs = userDefaults.value(forKey: "weatherVM") as? [[String : Any]] {
            weatherVMs.append(dict)
            userDefaults.set(weatherVMs, forKey: "weatherVM")
        } else {
            weatherViewModels.append(dict)
            userDefaults.set(weatherViewModels, forKey: "weatherVM")
        }
    }
    
    func numberOfRows(_ section: Int) -> Int {
        let userDefaults = UserDefaults.standard
        if let weatherVMs = userDefaults.value(forKey: "weatherVM") as? [[String : Any]] {
            return weatherVMs.count
        }
        return 0
    }
    
    func modelAt(_ index: Int) -> [String : Any] {
        let userDefaults = UserDefaults.standard
        if let weatherVMs = userDefaults.value(forKey: "weatherVM") as? [[String : Any]] {
            let dict = weatherVMs[index]
            return dict
        }
        return [:]
    }
    
}




