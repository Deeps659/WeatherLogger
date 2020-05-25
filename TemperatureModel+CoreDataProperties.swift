//
//  TemperatureModel+CoreDataProperties.swift
//  WeatherLogger
//
//  Created by DEEPALI MAHESHWARI on 22/05/20.
//  Copyright © 2020 DEEPALI MAHESHWARI. All rights reserved.
//
//

import Foundation
import CoreData


extension TemperatureModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TemperatureModel> {
        return NSFetchRequest<TemperatureModel>(entityName: "TemperatureModel")
    }

    @NSManaged public var humidity: NSDecimalNumber?
    @NSManaged public var temperature: Double
    @NSManaged public var temperatureMax: Double
    @NSManaged public var temperatureMin: Double
    @NSManaged public var weather: WeatherModel?

}
