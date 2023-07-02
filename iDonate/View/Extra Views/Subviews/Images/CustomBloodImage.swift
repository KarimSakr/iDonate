//
//  CustomBloodImage.swift
//  iDonate
//
//  Created by i-magineworks on 13/03/2023.
//

import SwiftUI

struct CustomBloodImage: View {
    
    var bloodTypeImage:String
    
    var body: some View {
        Image(bloodTypeImage)
            .resizable()
            .aspectRatio( contentMode: .fit)
            .frame(width: 60)
    }
}


struct CustomBloodImage_Previews: PreviewProvider {
    static var previews: some View {
        CustomBloodImage(bloodTypeImage: "O+")
            .previewLayout(.sizeThatFits)
    }
}
