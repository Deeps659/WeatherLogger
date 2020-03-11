//
//  WeatherLoggerViewModelTest.swift
//  WeatherLoggerTests
//
//  Created by DEEPALI MAHESHWARI on 11/03/20.
//  Copyright © 2020 DEEPALI MAHESHWARI. All rights reserved.
//

import XCTest
@testable import WeatherLogger

class WeatherLoggerViewModelTest: XCTestCase {
    
    private var weatherLoggerVM : WeatherLoggerViewModel!
    
    override func setUp() {
        super.setUp()
        weatherLoggerVM = WeatherLoggerViewModel()
        let weatherVM = WeatherViewModel(name: "Gurgaon", currentTemperature: TemperatureViewModel(temperature: 74, temperatureMin: 34, temperatureMax: 85, humidity: 50))
        weatherLoggerVM.addWeatherViewModel(weatherVM, dateString: "11-08-2020")
    }
    
    func test_should_save_to_user_defaults() {
        let userDefaults = UserDefaults.standard
        XCTAssertNotNil(userDefaults.value(forKey: "weatherVM"))
    }
    
    func test_should_return_correct_number_of_rows() {
        let rows = weatherLoggerVM.numberOfRows(0)
        XCTAssertEqual(rows, 1)
    }
    
    func test_should_return_correct_model() {
        let data = weatherLoggerVM.modelAt(0)
        XCTAssertEqual(data["city"] as! String, "Gurgaon")
    }
    
    override func tearDown() {
        super.tearDown()
        
        let userDefaults = UserDefaults.standard
        userDefaults.removeObject(forKey: "weatherVM")
    }

}
