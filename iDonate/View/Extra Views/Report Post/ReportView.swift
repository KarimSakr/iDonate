//
//  ReportView.swift
//  iDonate
//
//  Created by i-magineworks on 25/06/2023.
//

import SwiftUI

struct ReportView: View {
    
    //MARK: - PresentationMode
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    
    @State var donation: Donation
    
    @Binding var isDonationReported: Bool
    
    private let viewModel = ReportViewModel()
    
    var body: some View {
        VStack{
            List {
                ForEach(ReportReason.reportReasons, id:\.self) { reason in
                    Text(reason.rawValue)
                        .onTapGesture {
                            viewModel.reasonTapped(for: reason, from: donation)
                            isDonationReported = true
                            presentationMode.wrappedValue.dismiss()
                        }
                }
            }
        }
    }
}

struct ReportView_Previews: PreviewProvider {
    static var previews: some View {
        ReportView(donation: Donation(name: "Karim Sakr", location: "Hospital name", bloodType: .oPositive, phoneNumber: "546456", countryCode: .lebanon, optionalPhoneNumber: "546465", optionalCountryCode: .lebanon, notes: "Health", donationType: .wholeBloodDonation, units: 3, datePosted: 4334324.00, donated: true, email: "emailexample@gmail.com", reports: []), isDonationReported: .constant(false))
    }
}
