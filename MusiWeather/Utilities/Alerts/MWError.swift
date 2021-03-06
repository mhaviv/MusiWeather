//
//  MWError.swift
//  MusiWeather
//
//  Created by Michael Haviv on 8/2/21.
//

import Foundation

enum MWError: Error {
    //MARK: - User Errors
    case invalidCity
    case emptyCity
    
    //MARK: - Network Errors
    case invalidResponse
    case invalidData
    case invalidURL
    case unableToComplete
}
