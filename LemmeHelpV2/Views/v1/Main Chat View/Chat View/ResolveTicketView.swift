////
////  ResolveTicketView.swift
////  LemmeHelpV2
////
////  Created by Colin Power on 9/6/20.
////  Copyright © 2020 Colin Power. All rights reserved.
////
//
//import SwiftUI
//
//struct ResolveTicketView: View {
//    @ObservedObject private var viewModel = TicketsViewModel()
//    @Binding var ticketID:String
//    @Binding var showingResolve:Bool
//    
//    var body: some View {
//        VStack {
//            HStack {
//                Spacer()
//                Text("Resolve Ticket").font(.largeTitle)
//                Spacer()
//            }
//            Text("Tapping Resolve will end this conversation. Please make sure you have asked the customer if they have any other questions you might help with.").font(.headline)
//            Text("The customer will receive a survey to review this conversation").font(.headline)
//            Button(action: {
//                self.viewModel.resolveTicket(ticketID: self.ticketID, rating: 3)
//                self.showingResolve.toggle()
//            }) {
//                Text("Resolve").font(.largeTitle)
//                    .padding(12)
//                .foregroundColor(Color.blue)
//                .background(RoundedRectangle(cornerRadius: 7).fill(Color.blue.opacity(0.1)))
//                .background(RoundedRectangle(cornerRadius: 7).strokeBorder(Color.blue, lineWidth: 2))
//            }
//        }
//        
//    }
//}
//
//struct ResolveTicketView_Previews: PreviewProvider {
//    static var previews: some View {
//        ResolveTicketView(ticketID: .constant("abc123"), showingResolve: .constant(true))
//    }
//}
