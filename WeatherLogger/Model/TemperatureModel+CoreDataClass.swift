//
//  TemperatureModel+CoreDataClass.swift
//  WeatherLogger
//
//  Created by DEEPALI MAHESHWARI on 20/05/20.
//  Copyright © 2020 DEEPALI MAHESHWARI. All rights reserved.
//
//

import Foundation
import CoreData

@objc(TemperatureModel)
public class TemperatureModel: NSManagedObject, Codable {
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        do {
            try container.encode(temperature, forKey: .temperature)
            try container.encode(temperatureMin, forKey: .temperatureMin)
            try container.encode(temperatureMax, forKey: .temperatureMax)
            try container.encode(humidity, forKey: .humidity)
        } catch {
            print("error")
        }
    }
    
    required convenience public init(from decoder: Decoder) throws {
        // return the context from the decoder userinfo dictionary
        guard let contextUserInfoKey = CodingUserInfoKey.context,
        let managedObjectContext = decoder.userInfo[contextUserInfoKey] as? NSManagedObjectContext,
        let entity = NSEntityDescription.entity(forEntityName: "TemperatureModel", in: managedObjectContext)
        else {
            fatalError("decode failure")
        }
        // Super init of the NSManagedObject
        self.init(entity: entity, insertInto: managedObjectContext)
        let values = try decoder.container(keyedBy: CodingKeys.self)
        do {
            temperature = try values.decode(Double.self, forKey: .temperature)
            temperatureMin = try values.decode(Double.self, forKey: .temperatureMin)
            temperatureMax = try values.decode(Double.self, forKey: .temperatureMax)
            humidity = try values.decode(Int16.self, forKey: .humidity)
        } catch {
            print ("error")
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case temperature = "temp"
        case temperatureMin = "temp_min"
        case temperatureMax = "temp_max"
        case humidity
    }

}
