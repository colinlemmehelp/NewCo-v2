//
//  MyTicketRow.swift
//  LemmeHelpV2
//
//  Created by Colin Power on 8/22/20.
//  Copyright © 2020 Colin Power. All rights reserved.
//

import SwiftUI
import FirebaseFirestore
import Combine

struct MyTicketRow: View {
    var ticketID: String
    var name: String
    var question: String
    var latestTimestamp: String
    var isUnread: Bool
    var latestMessage: String
    
    var body: some View {
        HStack {
            VStack(alignment: .center) {
                if isUnread {
                    Image(systemName: "circle.fill")
                    .renderingMode(.template)
                    .foregroundColor(.blue)
                        .font(.footnote)
                } else {
                    Image(systemName: "circle.fill")
                    .renderingMode(.template)
                    .foregroundColor(.clear)
                    .font(.footnote)
                }
            }
            Spacer(minLength: 12)
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: "photo").font(.headline)
                    Text(name).font(.headline)
                    Spacer()
                    Text(latestTimestamp)
                        .font(.subheadline)
                }
                Text(latestMessage)
                    .font(.body)
            }
        }.padding(8)
            .background(RoundedRectangle(cornerRadius: 5).fill(Color("newPrimaryColor"))).padding(8)
                
            .clipped()
            .shadow(color: Color("newPrimaryColor"), radius: 2, x: 1, y: 1)
            
    }
}

struct MyTicketRow_Previews: PreviewProvider {
    
    static var previews: some View {
        MyTicketRow(ticketID: "abcdef", name: "test string", question: "question example", latestTimestamp: "test123", isUnread: true, latestMessage: "temp latest message")
    }
}
