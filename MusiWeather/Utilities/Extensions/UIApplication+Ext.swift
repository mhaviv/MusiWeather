//
//  UIApplication+Ext.swift
//  MusiWeather
//
//  Created by Michael Haviv on 8/23/21.
//

import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
