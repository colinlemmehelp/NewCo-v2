//
//  MyTicketRow.swift
//  LemmeHelpV2
//
//  Created by Colin Power on 10/22/20.
//  Copyright © 2020 Colin Power. All rights reserved.
//

import SwiftUI
import FirebaseFirestore
import Combine

struct MyTicketsRow: View {
    var ticket: Ticket
    var height: CGFloat = 0.5
    
    var body: some View {
        
        VStack(alignment: .leading) {
            HStack {
                if(ticket.lastMessage_isUnread) {
                    Text(ticket.customer_email)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.black)
                    Spacer()
                    Text(convertTicketTimestampToDateString(timestamp: ticket.lastMessage_timestamp))
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.black)
                } else {
                    Text(ticket.customer_email)
                        .font(.subheadline)
                        .fontWeight(.regular)
                        .foregroundColor(Color.black.opacity(0.7))
                    Spacer()
                    Text(convertTicketTimestampToDateString(timestamp: ticket.lastMessage_timestamp))
                        .font(.subheadline)
                        .fontWeight(.regular)
                        .foregroundColor(Color.black.opacity(0.7))
                }
            }
            if(ticket.lastMessage_isUnread) {
                Text(ticket.lastMessage_text)
                    .font(.body)
                    .foregroundColor(Color.black)
                    .lineLimit(2)
                    .padding(.bottom,12)
            } else {
                Text(ticket.lastMessage_text)
                    .font(.body)
                    .fontWeight(.regular)
                    .foregroundColor(Color.black.opacity(0.7))
                    .lineLimit(2)
                    .padding(.bottom,12)
            }
            HStack {
                if(ticket.tag_selected != "") {
                    Text(ticket.tag_selected)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .padding(.horizontal, 4)
                        .foregroundColor(Color.white)
                        .background(RoundedRectangle(cornerRadius: 2).fill(Color.blue.opacity(0.6)))
                } else {
                    Text("")
                }
                Spacer()
                Text(ticket.company_name).font(.subheadline).foregroundColor(Color.gray)
            }
            Rectangle()
                .frame(height: self.height)
                .padding(.horizontal, 8)
                .foregroundColor(Color.gray)
        }
        .padding(.horizontal, 8)
        .padding(.vertical, 8)
        .background(RoundedRectangle(cornerRadius: 1).fill(Color.white))
        //.background(RoundedRectangle(cornerRadius: 1).strokeBorder(Color.gray, lineWidth: 1))
    }
    
    private func convertTicketTimestampToDateString(timestamp: Int) -> String {
        //write "Oct 12, 3:43 PM"
        let date1 = Date(timeIntervalSince1970: Double(timestamp))
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd, h:mm a"
        
        return formatter.string(from: date1)
    }
    
}

//struct MyTicketRow_Previews: PreviewProvider {
//    static var previews: some View {
//        MyTicketRow()
//    }
//}
