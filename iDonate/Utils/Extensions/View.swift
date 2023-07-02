//
//  View.swift
//  iDonate
//
//  Created by i-magineworks on 25/06/2023.
//

import Foundation
import SwiftUI

extension View {
    func toast(isShowing: Binding<Bool>, text: String) -> some View {
        ZStack(alignment: .bottom) {
            self

            if isShowing.wrappedValue {
                ToastView(isShowing: isShowing, text: text)
                    .transition(.move(edge: .bottom))
            }
        }
    }
}
