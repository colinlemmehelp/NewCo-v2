//
//  NewTicketRow.swift
//  LemmeHelpV2
//
//  Created by Colin Power on 8/5/20.
//  Copyright © 2020 Colin Power. All rights reserved.
//

import SwiftUI
import FirebaseFirestore
import Combine

struct NewTicketRow: View {
    var ticketID: String
    var name: String
    var question: String
    var timestamp: String

    
    
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "photo").font(.headline)
                Text("Bonobos").font(.headline)
                Spacer()
                Text(timestamp).font(.subheadline)
            }
            Text(question).lineLimit(2)
        }.padding(8)
            .background(RoundedRectangle(cornerRadius: 5).fill(Color.blue.opacity(0.05))).padding(8)

    }
}

struct NewTicketRow_Previews: PreviewProvider {
    
    static var previews: some View {
        NewTicketRow(ticketID: "abcdef", name: "test string", question: "question example", timestamp: "test123")
    }
}
