//
//  View+Ext.swift
//  MusiWeather
//
//  Created by Michael Haviv on 8/22/21.
//

import SwiftUI

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {

        ZStack(alignment: alignment) {
            placeholder()
                .opacity(shouldShow ? 0.8 : 0)
            self
        }
    }
}
