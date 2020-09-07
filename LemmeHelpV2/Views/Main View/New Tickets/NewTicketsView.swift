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

    //MAYBE ADD FORCE TOUCH IN THE FUTURE? FOR QUICK AUTO ASSIGNMENTS?
    //https://www.youtube.com/watch?v=7f6w-alJvSw

    
    var body: some View {
        GeometryReader { geometry in
            NavigationView {
                VStack {
                    NewTicketsBannerView()
                    ScrollView {
                        VStack (spacing: 0) {
                            ForEach(self.viewModel.newTickets) { ticket in
                                NavigationLink(destination: ChatView(ticketID: ticket.ticketID, autoTag: ticket.autoTag, agentTag: ticket.agentTag, isAutoTagCorrect: ticket.isAutoTagCorrect, customerName: ticket.name)) {
                                    NewTicketRow(ticketID: ticket.ticketID, name: ticket.name, question: ticket.question, timestamp: ticket.timestamp, autoTag: ticket.autoTag)
                                }.buttonStyle(PlainButtonStyle())
                            }
                        }
                        Rectangle().frame(width: geometry.size.width, height: 0.01)
                    }.background(Color.gray.opacity(0.1))
                    BottomTabView(selection: self.$selection)
                }.navigationBarTitle(Text(""))
                .navigationBarHidden(true)
            }
            .onAppear(perform: {
            self.viewModel.fetchTickets()
            })
        }.edgesIgnoringSafeArea([.top, .bottom])
        
    }
}

struct NewTicketsView_Previews: PreviewProvider {
    static var previews: some View {
        NewTicketsView(selection: .constant(.newTicketsTab))
    }
}


