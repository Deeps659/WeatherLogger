//
//  WeatherLoggerTableViewCell.swift
//  WeatherLogger
//
//  Created by DEEPALI MAHESHWARI on 10/03/20.
//  Copyright © 2020 DEEPALI MAHESHWARI. All rights reserved.
//

import UIKit

class WeatherLoggerTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    
    func configure(_ vm: WeatherModel) {
        
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let dateStr = formatter.string(from: vm.date ?? Date())
         
        let city = vm.name
        let temp = vm.currentTemperature?.temperature
        self.cityLabel.text = city
        self.dateLabel.text = "Current time: \(dateStr)"
        let formattedTemp = String(format: "%.0f°",temp!)
        self.tempLabel.text = "Current temperature: \(formattedTemp)F"
    }

}
