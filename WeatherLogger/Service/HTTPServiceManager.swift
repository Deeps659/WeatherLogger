//
//  HTTPServiceManager.swift
//  WeatherLogger
//
//  Created by DEEPALI MAHESHWARI on 10/03/20.
//  Copyright © 2020 DEEPALI MAHESHWARI. All rights reserved.
//

import Foundation

//struct Resource<W> {
//    let url: URL
//    let parse: (Data) -> W?
//}

enum Result<Success, Failure : Error> {
    case success(Success)
    case failure(Failure)
}

enum HTTPError: Error {
    case invalidURL
    case emptyData
    case invalidResponse(Data?, URLResponse?)
}

final class HTTPServiceManager {
    
    func loadData(urlStr: String, completion: @escaping (Result<Data, Error>) -> ()) {
        guard let url = URL(string: urlStr) else {
            completion(.failure(HTTPError.invalidURL))
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                completion(.success(data))
            } else {
                completion(.failure(HTTPError.emptyData))
            }
            
        }.resume()
        
    }
    
}
