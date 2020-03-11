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
    
    
    func configure(_ vm: [String:Any]) {
        
        let dateStr = vm["date"] as! String
        let city = vm["city"] as! String
        let temp = vm["temp"] as! Double
        self.cityLabel.text = city
        self.dateLabel.text = "Current time: \(dateStr)"
        let formattedTemp = String(format: "%.0f°",temp)
        self.tempLabel.text = "Current temperature: \(formattedTemp)F"
    }

}
