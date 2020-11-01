//
//  MessageHeader.swift
//  LemmeHelpV2
//
//  Created by Colin Power on 10/26/20.
//  Copyright © 2020 Colin Power. All rights reserved.
//

import SwiftUI

struct MessageHeader: View {
    var ticket: Ticket
    
    @State var showSelectTagSheet = false
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
                if (ticket.ticket_mode == "SMS") {
                    Text(ticket.customer_phone)
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.black.opacity(0.7))
                        .padding(.bottom, 2)
                } else {
                    Text(ticket.customer_email)
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.black.opacity(0.7))
                        .padding(.bottom, 2)
                }
                Text(convertHeaderTimestampToDateString(timestamp: ticket.ticket_timestamp))
                    .font(.subheadline)
                    .foregroundColor(Color.gray)
                    .padding(.bottom, 4)
                    
            }
            Spacer()
            if (ticket.tag_selected != "") {
                VStack(alignment: .trailing) {
                    HStack {
                        Image(systemName: "tag")
                        Text(ticket.tag_selected).padding(.trailing, 4)
                    }.padding(4)
                    .foregroundColor(Color.blue)
                    .background(RoundedRectangle(cornerRadius: 7).fill(Color.blue.opacity(0.1)))
                    .background(RoundedRectangle(cornerRadius: 7).strokeBorder(Color.blue, lineWidth: 1))
                }
            } else {
                Button(action: {self.showSelectTagSheet.toggle()}) {
                    Text("+ Add tag")
                        .font(.subheadline)
                        .fontWeight(.regular)
                        .foregroundColor(Color.blue)
                    .sheet(isPresented: $showSelectTagSheet, content: {
                        //SelectTag()
                    })
                }
            }
        }.padding(.horizontal, 16)
        .padding(.vertical, 8)
        .background(RoundedRectangle(cornerRadius: 1).fill(Color.gray.opacity(0.2)))
    }
    
    
    private func convertHeaderTimestampToDateString(timestamp: Int) -> String {
        let date1 = Date(timeIntervalSince1970: Double(timestamp))
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM d, h:mm a"
        
        return formatter.string(from: date1)
    }
    
    
}

//struct MessageHeader_Previews: PreviewProvider {
//    static var previews: some View {
//        MessageHeader()
//    }
//}
