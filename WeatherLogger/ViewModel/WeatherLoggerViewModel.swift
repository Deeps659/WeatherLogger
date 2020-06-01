//
//  WeatherViewModel.swift
//  WeatherLogger
//
//  Created by DEEPALI MAHESHWARI on 10/03/20.
//  Copyright © 2020 DEEPALI MAHESHWARI. All rights reserved.
//

import Foundation
import CoreData

class WeatherLoggerViewModel {
    
    var data = [WeatherModel]()
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "WeatherLoggerModel")
        
        // load the database if it exists, if not create it.
        container.loadPersistentStores { storeDescription, error in
            // resolve conflict by using correct NSMergePolicy
            container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
            
            if let error = error {
                print("Unresolved error \(error)")
            }
        }
        return container
    }()
    
    init() {
        loadSavedData()
    }
    
    func loadSavedData() {
            let request: NSFetchRequest<WeatherModel> = WeatherModel.fetchRequest()
            //let sort = NSSortDescriptor(key: "gitcommit.committer.date", ascending: false)
            //request.sortDescriptors = [sort]
    
            do {
                // fetch is performed on the NSManagedObjectContext
                data = try persistentContainer.viewContext.fetch(request)
                print("Got \(data.count) weathermodel")
            } catch {
                print("Fetch failed")
            }
        }
    
    // save changes from memory back to the database (from memory)
    // viewContext is checked for changes
    // then saves are comitted to the store
    func saveContext() {
        if persistentContainer.viewContext.hasChanges {
            do {
                try persistentContainer.viewContext.save()
                print ("Saved")
            } catch {
                print("An error occurred while saving: \(error)")
            }
        }
    }
    
    func numberOfRows(_ section: Int) -> Int {
        return data.count
    }
    
    func modelAt(_ index: Int) -> WeatherModel {
        return data[index]
    }
    
    func getWeatherResource(_ data: Data) -> WeatherModel? {
        
        let decoder = JSONDecoder()
        // Assign the NSManagedObject Context to the decoder
        decoder.userInfo[CodingUserInfoKey.context!] = self.persistentContainer.viewContext
        
        let weatherVM = try? decoder.decode(WeatherModel.self, from: data)
        return weatherVM
    }
    
}




