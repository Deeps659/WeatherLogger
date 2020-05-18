//
//  WeatherModel.swift
//  WeatherLogger
//
//  Created by DEEPALI MAHESHWARI on 18/05/20.
//  Copyright © 2020 DEEPALI MAHESHWARI. All rights reserved.
//

import UIKit

struct WeatherModel: Decodable {
    
    let name: String
    let currentTemperature: TemperatureModel
    
    private enum CodingKeys: String, CodingKey {
        case name
        case currentTemperature = "main"
    }
    
}

struct TemperatureModel: Decodable {
    
    let temperature: Double
    let temperatureMin: Double
    let temperatureMax: Double
    let humidity: Int
    
    private enum CodingKeys: String, CodingKey {
        case temperature = "temp"
        case temperatureMin = "temp_min"
        case temperatureMax = "temp_max"
        case humidity
    }
}
