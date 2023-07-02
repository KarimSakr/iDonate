//
//  ToastView.swift
//  iDonate
//
//  Created by i-magineworks on 25/06/2023.
//

import SwiftUI

struct ToastView: View {
    
    @Binding var isShowing: Bool
    let text: String

    var body: some View {
        VStack {
            Spacer()
 
            Text(text)
            // here, I used the appBackgroundColor to inverse the text's color from its background
                .foregroundColor(Color.appBackgroundColor)
                .padding()
                .background(Color.appToastColor.opacity(0.7))
                .cornerRadius(10)
                .padding(.horizontal, 30)
        }
        .animation(.easeInOut, value: isShowing)
        .transition(.move(edge: .bottom))
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation {
                    isShowing = false
                }
            }
        }
    }
}

struct ToastView_Previews: PreviewProvider {
    static var previews: some View {
        ToastView(isShowing: .constant(true), text: "Toast Message here!")
    }
}
