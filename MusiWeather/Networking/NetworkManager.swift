//
//  NetworkManager.swift
//  MusiWeather
//
//  Created by Michael Haviv on 6/28/21.
//

import Foundation

// Generic Type and will have a generic constraint for Codable
final class NetworkManager<T: Codable> {
    
    /// Takes in the url and fetches data from the API
    /// - Parameters:
    ///   - url: Expect caller to supply a URL that should be called
    ///   - completion: completion handler that either returns the data or a Network Error
    static func fetch(for url: URL, completion: @escaping (Result<T, NetworkError>) -> Void) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil else {
                print(String(describing: error!))
                completion(.failure(.error(err: error!.localizedDescription)))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let json = try JSONDecoder().decode(T.self, from: data)
                completion(.success(json))
            } catch let err {
                print(String(describing: err))
                completion(.failure(.decodingError(err: err.localizedDescription)))
            }
            
        }.resume()
    }
}


enum NetworkError: Error {
    case invalidResponse
    case invalidData
    case error(err: String)
    case decodingError(err: String)
}
