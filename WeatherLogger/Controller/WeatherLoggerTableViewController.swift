//
//  WeatherLoggerTableViewController.swift
//  WeatherLogger
//
//  Created by DEEPALI MAHESHWARI on 10/03/20.
//  Copyright © 2020 DEEPALI MAHESHWARI. All rights reserved.
//

import UIKit

class WeatherLoggerTableViewController: UITableViewController {
    
    private var weatherLoggerViewModel = WeatherLoggerViewModel()
    private var cityName : String = "Gurgaon"

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Weather Logger for \(cityName)"
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if weatherLoggerViewModel.numberOfRows(0) > 3 {
            let indexPath = IndexPath(row: weatherLoggerViewModel.numberOfRows(0) - 1, section: 0)
            tableView.scrollToRow(at: indexPath, at: .top, animated: false)
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.weatherLoggerViewModel.numberOfRows(section)
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as! WeatherLoggerTableViewCell

        let weatherVM = self.weatherLoggerViewModel.modelAt(indexPath.row)
        cell.configure(weatherVM)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "weatherDetail") as? WeatherDetailsViewController
        let weatherVM = self.weatherLoggerViewModel.modelAt(indexPath.row)
        controller?.configure(vm: weatherVM)
        
        if let vc = controller {
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
    
    
    

    @IBAction func loadCurrentTemp(_ sender: UIBarButtonItem) {
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .full
        let dateString = dateFormatter.string(from: Date())
        
        let weatherURL = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(cityName)&APPID=a6d75244f45c82b9690164487bcfb318&units=imperial")!
        
        let weatherResource = Resource<WeatherModel>(url: weatherURL) { data in
            
            let weatherVM = try? JSONDecoder().decode(WeatherModel.self, from: data)
            return weatherVM
        }
        
        HTTPServiceManager().loadData(resource: weatherResource) { [weak self] result in
            if let weatherVM = result {
                self?.weatherLoggerViewModel.addWeatherViewModel(weatherVM, dateString: dateString)
                print(weatherVM)
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                    if let count = self?.weatherLoggerViewModel.numberOfRows(0) {
                        if count > 3 {
                            let indexPath = IndexPath(row: count-1, section: 0)
                            self?.tableView.scrollToRow(at: indexPath, at: .top, animated: false)
                        }
                        
                    }
                    
                }
            }
        }
    }

    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let nav = segue.destination as? UINavigationController {
            if let vc = nav.viewControllers.first as? ChangeCityViewController {
                vc.changeCityDelegate = self
            }
        }
    }
    

}

// MARK: - Change city Delegate
extension WeatherLoggerTableViewController : ChangeCityDelegate {
    func changeCity(cityName: String) {
        self.cityName = cityName
        self.navigationItem.title = "Weather Logger for \(cityName)"
    }
    
    
}
