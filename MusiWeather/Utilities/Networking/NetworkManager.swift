//
//  NetworkManager.swift
//  MusiWeather
//
//  Created by Michael Haviv on 8/2/21.
//

import UIKit

final class NetworkManager: Decodable {
    
    static let shared = NetworkManager()
    
    /// Once its completed we will have a result. The result is going to either have an array of appetizers or return an error
    func getWeather(for url: String, completed: @escaping (Result<WeatherResponse, MWError>) -> Void) {
        let task = URLSession.shared.dataTask(with: URLRequest(url: URL(string: url)!)) { data, response, error in
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(WeatherResponse.self, from: data)
                completed(.success(decodedResponse))
            } catch {
                completed(.failure(.invalidData))
                return
            }
        }
        task.resume()
    }
    
}
