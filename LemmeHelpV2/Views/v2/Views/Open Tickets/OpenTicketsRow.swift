//
//  OpenTicketRow.swift
//  LemmeHelpV2
//
//  Created by Colin Power on 10/22/20.
//  Copyright © 2020 Colin Power. All rights reserved.
//

import SwiftUI
import FirebaseFirestore
import Combine

struct OpenTicketsRow: View {
    var ticket: Ticket
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(ticket.customer_email).font(.headline)
                Spacer()
                Text(convertTicketTimestampToDateString(timestamp: ticket.ticket_timestamp)).font(.subheadline).foregroundColor(Color.gray)
            }.padding(.bottom, 2)
            Text(ticket.ticket_text).font(.body).lineLimit(2).padding(.bottom,8)
            HStack {
                if (ticket.tag_automatic != "") {
                    HStack {
                        Image(systemName: "tag")
                        Text(ticket.tag_automatic).padding(.trailing, 4)
                    }.padding(4)
                    .foregroundColor(Color.blue)
                    .background(RoundedRectangle(cornerRadius: 7).fill(Color.blue.opacity(0.1)))
                    .background(RoundedRectangle(cornerRadius: 7).strokeBorder(Color.blue, lineWidth: 1))
                } else {
                    HStack {
                        Text("")
                    }
                }
                Spacer()
                Text(ticket.company_name).font(.subheadline).foregroundColor(Color.gray)
            }.padding(.bottom, 4)
        }.padding(.horizontal, 8)
            .padding(.vertical, 8)
            .background(RoundedRectangle(cornerRadius: 5).fill(Color.white)).padding(8)
    }
    
    //dateformatting help!!
    //https://stackoverflow.com/questions/35700281/date-format-in-swift
    
    private func convertTicketTimestampToDateString(timestamp: Int) -> String {
        //write "Oct 12, 3:43 PM"
        let date1 = Date(timeIntervalSince1970: Double(timestamp))
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd, h:mm a"
        
        return formatter.string(from: date1)
    }
    
}



//struct OpenTicketRow_Previews: PreviewProvider {
//    static var previews: some View {
//        OpenTicketRow()
//    }
//}
