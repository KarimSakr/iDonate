//
//  CustomTitleText.swift
//  iDonate
//
//  Created by i-magineworks on 16/04/2023.
//

import SwiftUI

struct CustomTitleText: View {
    @State var titleText:String
    var body: some View {
        HStack{
            Spacer()
            Text(titleText)
                .font(.largeTitle)
                .fontWeight(.bold)
                .frame(alignment: .center)
                .padding()
            Spacer()
        }
    }
}

struct CustomTitleText_Previews: PreviewProvider {
    static var previews: some View {
        CustomTitleText(titleText: "Title")
    }
}
