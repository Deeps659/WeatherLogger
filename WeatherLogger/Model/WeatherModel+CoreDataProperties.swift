//
//  WeatherModel+CoreDataProperties.swift
//  WeatherLogger
//
//  Created by DEEPALI MAHESHWARI on 20/05/20.
//  Copyright © 2020 DEEPALI MAHESHWARI. All rights reserved.
//
//

import Foundation
import CoreData


extension WeatherModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<WeatherModel> {
        return NSFetchRequest<WeatherModel>(entityName: "WeatherModel")
    }

    @NSManaged public var name: String?
    @NSManaged public var currentTemperature: TemperatureModel?
    @NSManaged public var date: Date?

}
