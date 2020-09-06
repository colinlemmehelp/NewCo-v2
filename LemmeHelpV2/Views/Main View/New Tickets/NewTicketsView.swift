//
//  NewTicketsView.swift
//  LemmeHelpV2
//
//  Created by Colin Power on 8/22/20.
//  Copyright © 2020 Colin Power. All rights reserved.
//

import SwiftUI

struct NewTicketsView: View {
    @EnvironmentObject var session: SessionStore

    @ObservedObject private var viewModel = TicketsViewModel()
    
    @Binding var selection: TicketView.SelectedTab

    

    
    var body: some View {
        Group{
            NavigationView {
                VStack {
                    NewTicketsBannerView()
                    
                    List {
                        ForEach(viewModel.newTickets) { ticket in
                            NavigationLink(destination: ChatView(ticketID: ticket.ticketID, autoTag: ticket.autoTag, agentTag: ticket.agentTag, isAutoTagCorrect: ticket.isAutoTagCorrect, customerName: ticket.name)) {
                                NewTicketRow(ticketID: ticket.ticketID, name: ticket.name, question: ticket.question, timestamp: ticket.latestTimestamp)
                            }
                            
                            
//                            ChatView(ticketID: ticket.ticketID, customerName: ticket.name, autoTag: ticket.autoTag, agentTag: ticket.agentTag)) {
//
//                            }
                        }
                    }
                    BottomTabView(selection: $selection)
                }.navigationBarTitle(Text(""))
                .navigationBarHidden(true)
            }
        }.onAppear(perform: {
            self.viewModel.fetchTickets()
            })
    }
}

//struct NewTicketsView_Previews: PreviewProvider {
//    static var previews: some View {
//        NewTicketsView()
//    }
//}

struct NewTicketsView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
