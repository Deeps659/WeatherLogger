//
//  WeatherDetailsViewController.swift
//  WeatherLogger
//
//  Created by DEEPALI MAHESHWARI on 11/03/20.
//  Copyright © 2020 DEEPALI MAHESHWARI. All rights reserved.
//

import UIKit

class WeatherDetailsViewController: UIViewController {

    @IBOutlet weak var humidityImageView: UIImageView!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var tempMaxLabel: UILabel!
    @IBOutlet weak var tempMinLabel: UILabel!
        
    private var data = [String :Any]()
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Weather Details"
        setupData()
    }
    
    func setupData() {
        let tempMax = data["tempMax"] as! Double
        let tempMin = data["tempMin"] as! Double
        let humidity = data["humidity"] as! Int
        tempMaxLabel?.text = "Max temperature : \(tempMax)"
        tempMinLabel?.text = "Min temperature : \(tempMin)"
        humidityLabel?.text = "Humidity : \(humidity)"
        switch humidity {
            case 0..<25:
                humidityImageView?.image = UIImage.init(systemName: "sun.max.fill")
            case 25..<50:
                humidityImageView?.image = UIImage.init(systemName: "sun.min.fill")
            case 50..<75:
                humidityImageView?.image = UIImage.init(systemName: "cloud.sun.fill")
            case 75..<85:
                humidityImageView?.image = UIImage.init(systemName: "cloud.sun.rain.fill")
            case 85...100:
                humidityImageView?.image = UIImage.init(systemName: "cloud.bolt.rain.fill")

        default:
            humidityImageView?.image = UIImage.init(systemName: "sun.max.fill")
        }
    }
    
    func configure(vm : [String:Any]) {
        data = vm
    }
    

}
