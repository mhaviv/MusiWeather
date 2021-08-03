//
//  Alert.swift
//  MusiWeather
//
//  Created by Michael Haviv on 8/2/21.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id  = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContext {
    
    //MARK: - Network Alerts
    static let invalidData      = AlertItem(title: Text("Server Error"),
                                            message: Text("The data recieved frfom the server was invalid. Please contact support."),
                                            dismissButton: .default(Text("OK")))
    
    static let invalidResponse  = AlertItem(title: Text("Server Error"),
                                            message: Text("Invalid response from the server. Please try again later or contact support."),
                                            dismissButton: .default(Text("OK")))
        
//    static let invalidURL       = AlertItem(title: Text("Server Error"),
//                                            message: Text("There was an issue contacting the server. If this persists, please contact support."),
//                                            dismissButton: .default(Text("OK")))
    
    static let unableToComplete = AlertItem(title: Text("Server Error"),
                                            message: Text("Unable to check your request at this time. Please check your internet connection"),
                                            dismissButton: .default(Text("OK")))
}
