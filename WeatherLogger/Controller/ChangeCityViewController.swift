//
//  ChangeCityViewController.swift
//  WeatherLogger
//
//  Created by DEEPALI MAHESHWARI on 11/03/20.
//  Copyright © 2020 DEEPALI MAHESHWARI. All rights reserved.
//

import UIKit

protocol ChangeCityDelegate {
    func changeCity(cityName : String)
}
class ChangeCityViewController: UIViewController {
    
    var changeCityDelegate : ChangeCityDelegate?

    @IBOutlet weak var cityNameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func close(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveLocation(_ sender: UIButton) {
        if let cityName = cityNameTextField.text {
            changeCityDelegate?.changeCity(cityName: cityName)
            self.dismiss(animated: true, completion: nil)
        }
        
    }

}
