//
//  WeatherModel+CoreDataClass.swift
//  WeatherLogger
//
//  Created by DEEPALI MAHESHWARI on 20/05/20.
//  Copyright © 2020 DEEPALI MAHESHWARI. All rights reserved.
//
//

import Foundation
import CoreData

@objc(WeatherModel)
public class WeatherModel: NSManagedObject, Codable {
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        do {
            try container.encode(name ?? "blank", forKey: .name)
        } catch {
            print("error")
        }
    }
    
    required convenience public init(from decoder: Decoder) throws {
        // return the context from the decoder userinfo dictionary
        guard let contextUserInfoKey = CodingUserInfoKey.context,
        let managedObjectContext = decoder.userInfo[contextUserInfoKey] as? NSManagedObjectContext,
        let entity = NSEntityDescription.entity(forEntityName: "WeatherModel", in: managedObjectContext)
        else {
            fatalError("decode failure")
        }
        // Super init of the NSManagedObject
        self.init(entity: entity, insertInto: managedObjectContext)
        let values = try decoder.container(keyedBy: CodingKeys.self)
        do {
            name = try values.decode(String.self, forKey: .name)
            currentTemperature = try values.decode(TemperatureModel.self, forKey: .currentTemperature)
        } catch {
            print ("error")
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case name
        case currentTemperature = "main"
    }
    

   

}
