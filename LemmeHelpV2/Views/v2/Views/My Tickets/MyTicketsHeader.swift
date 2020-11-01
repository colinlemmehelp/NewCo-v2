//
//  MyTicketsHeader.swift
//  LemmeHelpV2
//
//  Created by Colin Power on 10/31/20.
//  Copyright © 2020 Colin Power. All rights reserved.
//

import SwiftUI

struct MyTicketsHeader: View {
    @Binding var ticketStatus: Int
    
    private let options = ["Open", "Closed"]
    
    var body: some View {
        HStack {
            Spacer()
            Picker(selection: $ticketStatus, label: Text("Filter view")) {
                ForEach(0 ..< options.count) {
                    Text(self.options[$0])
                }
            }.pickerStyle(SegmentedPickerStyle())
            Spacer()
        }.padding(.horizontal, 32)
    }
}

//struct MyTicketsHeader_Previews: PreviewProvider {
//    static var previews: some View {
//        MyTicketsHeader()
//    }
//}
