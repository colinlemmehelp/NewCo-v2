////
////  NewTicketRow.swift
////  LemmeHelpV2
////
////  Created by Colin Power on 8/5/20.
////  Copyright © 2020 Colin Power. All rights reserved.
////
//
//import SwiftUI
//import FirebaseFirestore
//import Combine
//
//struct NewTicketRow: View {
//    
//    
//    var ticket: TicketV2
//    
//    var body: some View {
//        VStack(alignment: .leading) {
//            if (ticket.tag_automatic != "") {
//                HStack {
//                    Text(ticket.company_name).font(.headline)
//                    Spacer()
//                    HStack {
//                        Image(systemName: "tag")
//                        Text(ticket.tag_automatic).padding(.trailing, 4)
//                    }.padding(4)
//                    .foregroundColor(Color.blue)
//                    .background(RoundedRectangle(cornerRadius: 7).fill(Color.blue.opacity(0.1)))
//                    .background(RoundedRectangle(cornerRadius: 7).strokeBorder(Color.blue, lineWidth: 1))
//                }.padding(.bottom, 0)
//            } else {
//                HStack {
//                    Text(ticket.company_name).font(.headline)
//                    Spacer()
//                }.padding(.bottom, 8)
//            }
//            Text(ticket.ticket_text).font(.body).lineLimit(2).padding(.bottom,12)
//            HStack {
//                Text(ticket.customer_email).font(.subheadline).foregroundColor(Color.gray)
//                Spacer()
//                Text(String(ticket.ticket_timestamp)).font(.subheadline).foregroundColor(Color.gray)
//            }
//        }.padding(.horizontal, 8)
//            .padding(.vertical, 8)
//            .background(RoundedRectangle(cornerRadius: 5).fill(Color.white)).padding(8)
//    }
//}
//
////struct NewTicketRow_Previews: PreviewProvider {
////
////    static var previews: some View {
////        NewTicketRow(ticketID: "abcdef", name: "test string", question: "question example", timestamp: "9:31 AM", autoTag: "return")
////    }
////}
//
//
////            if (name == "Cecily Power") {
////                HStack {
////                    Spacer()
////                    Text("Bonobos MVP!").font(.footnote).foregroundColor(Color.green)
////                    Spacer()
////                }.background(Color.green.opacity(0.15))
////                    .padding(.bottom, 4)
////            }
