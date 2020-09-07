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
    var autoTag: String

    
    
    
    var body: some View {
        VStack(alignment: .leading) {
            if (name == "Cecily Power") {
                HStack {
                    Spacer()
                    Text("Bonobos MVP!").font(.footnote).foregroundColor(Color.green)
                    Spacer()
                }.background(Color.green.opacity(0.15))
                    .padding(.bottom, 4)
            }
            if (self.autoTag != "") {
                HStack {
                    Text(self.name).font(.headline)
                    Spacer()
                    HStack {
                        Image(systemName: "tag")
                        Text(self.autoTag).padding(.trailing, 4)
                    }.padding(4)
                    .foregroundColor(Color.blue)
                    .background(RoundedRectangle(cornerRadius: 7).fill(Color.blue.opacity(0.1)))
                    .background(RoundedRectangle(cornerRadius: 7).strokeBorder(Color.blue, lineWidth: 1))
                }.padding(.bottom, 0)
            } else {
                HStack {
                    Text(self.name).font(.headline)
                    Spacer()
                }.padding(.bottom, 8)
            }
            Text(question).font(.body).lineLimit(2).padding(.bottom,12)
            HStack {
                Text("Bonobos").font(.subheadline).foregroundColor(Color.gray)
                Spacer()
                Text(timestamp).font(.subheadline).foregroundColor(Color.gray)
            }
        }.padding(.horizontal, 8)
            .padding(.vertical, 8)
            .background(RoundedRectangle(cornerRadius: 5).fill(Color.white)).padding(8)
    }
}

struct NewTicketRow_Previews: PreviewProvider {
    
    static var previews: some View {
        NewTicketRow(ticketID: "abcdef", name: "test string", question: "question example", timestamp: "9:31 AM", autoTag: "return")
    }
}
