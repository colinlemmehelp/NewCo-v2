//
//  MagicTextField.swift
//  LemmeHelpV2
//
//  Created by Colin Power on 10/22/20.
//  Copyright © 2020 Colin Power. All rights reserved.
//

import SwiftUI

struct MagicTextField: View {
    @EnvironmentObject var session: SessionStore

    @ObservedObject var viewModel = TicketViewModel()
    @ObservedObject var messageViewModel = MessageViewModel()

    @State private var response: String = ""
    
    @State var showSheet = false
    @State var showResolutionSheet = false
    
    var ticket: Ticket
    
    func sendResponse() {
        if (ticket.state_agentID == "") {
            viewModel.createFirstAgentResponseTimestamp(ticket_reference: self.ticket.ticket_reference)
        }
        messageViewModel.addResponse(ticket_reference: self.ticket.ticket_reference, message: self.response, state_agentID: session.session!.uid, ticket_mode: self.ticket.ticket_mode)
        self.response = ""
    }


    var body : some View {
        VStack {
            ScrollView(.horizontal) {
                HStack(spacing: 10) {
                    //Create initial spacing
                    Text("    ")
                    
                    //Shopify button
                    Button(action: {self.showSheet.toggle()}) {
                        Image("Shopify")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.green)
                        .sheet(isPresented: $showSheet, content: {
                            ShopifyOrder(ticket: ticket, showSheet: self.$showSheet)
                        })
                    }
                    
                    
                    //Docs
                    Text("View docs").font(.subheadline).foregroundColor(Color.purple)
                    .padding(4)
                    .background(RoundedRectangle(cornerRadius: 5).fill(Color.purple.opacity(0.2)))
                    .background(RoundedRectangle(cornerRadius: 5).strokeBorder(Color.purple, lineWidth: 2))

                    //Snippets
                    Text("Insert snippet").font(.subheadline).foregroundColor(Color.green)
                    .padding(4)
                    .background(RoundedRectangle(cornerRadius: 5).fill(Color.green.opacity(0.2)))
                    .background(RoundedRectangle(cornerRadius: 5).strokeBorder(Color.green, lineWidth: 2))

                    //Autocompletion
                    Text("Try auto answer").font(.subheadline).foregroundColor(Color.blue)
                    .padding(4)
                    .background(RoundedRectangle(cornerRadius: 5).fill(Color.blue.opacity(0.2)))
                    .background(RoundedRectangle(cornerRadius: 5).strokeBorder(Color.blue, lineWidth: 2))

                    //Resolution button
                    Button(action: {self.showResolutionSheet.toggle()}) {
                        Image(systemName: "checkmark.circle.fill")
                            .font(.body)
                            .sheet(isPresented: $showResolutionSheet, content: {
                                ResolveTicket(ticket: ticket, showResolutionSheet: self.$showResolutionSheet)
                            })
                    }

                }
            }.background(Color("newPrimaryColor"))
            HStack {
                TextField("Enter a response", text: $response)
                    .font(.body)
                    .padding(12)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                    .padding(.trailing, 8)
                Button(action: self.sendResponse, label: {
                    Image(systemName: "arrow.up.circle.fill").font(.title)
                })
            }.padding(.horizontal)
            .padding(.top, 8)
            .padding(.bottom, 16)
        }
        .edgesIgnoringSafeArea([.bottom])
//        .padding(.bottom, 60)
//        .padding(.top, 8)
//        .background(Color("newPrimaryColor"))

    }
}

//Button(action: {
//    self.viewModel.resolveTicket(ticket_reference: self.ticket.ticket_reference, state_rating: 5)
//  }) {
//    Text("Resolve Question")
//}
