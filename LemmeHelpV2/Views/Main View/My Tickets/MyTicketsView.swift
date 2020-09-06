//
//  MyTicketsView.swift
//  LemmeHelpV2
//
//  Created by Colin Power on 8/22/20.
//  Copyright © 2020 Colin Power. All rights reserved.
//

import SwiftUI

struct MyTicketsView: View {
    @EnvironmentObject var session: SessionStore

    @ObservedObject private var viewModel = TicketsViewModel()
    
    @Binding var selection: TicketView.SelectedTab

    
    var body: some View {
        Group {
            NavigationView {
                VStack {
                    MyTicketsBannerView()
                    List {
                        ForEach(viewModel.myTickets) { ticket in
                            NavigationLink(destination: ChatView(ticketID: ticket.ticketID, autoTag: ticket.autoTag, agentTag: ticket.agentTag, isAutoTagCorrect: ticket.isAutoTagCorrect, customerName: ticket.name)) {
                                MyTicketRow(ticketID: ticket.ticketID, name: ticket.name, question: ticket.question, latestTimestamp: ticket.latestTimestamp, isUnread: ticket.isUnread, latestMessage: ticket.latestMessage)
                                //isAutoTagCorrect: ticket.isAutoTagCorrect,
                            }
                        }
                    }
                    BottomTabView(selection: $selection)
                }
                .navigationBarTitle("")
                .navigationBarHidden(true)
            }
        }.onAppear(perform: {
            print("back reloading this page again!")
            self.viewModel.getTicketsForAgent(agentID: self.session.session!.uid)
            })
    }
}

//struct MyTicketsView_Previews: PreviewProvider {
//    static var previews: some View {
//        MyTicketsView()
//    }
//}
