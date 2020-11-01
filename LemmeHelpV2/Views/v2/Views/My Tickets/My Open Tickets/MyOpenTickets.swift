//
//  MyOpenTickets.swift
//  LemmeHelpV2
//
//  Created by Colin Power on 10/31/20.
//  Copyright © 2020 Colin Power. All rights reserved.
//

import SwiftUI

struct MyOpenTickets: View {
    //Use the environment variable to check for signout etc.
    @EnvironmentObject var session: SessionStore
    
    //Use the binding var to pass along to the TabsView so it can switch tabs
    @Binding var desiredTab: RouterView.tabChoices
    
    //Observe the Tickets ViewModel to get the latest tix
    @ObservedObject var viewModel = TicketViewModel()
    
    //Initialize the router on the MyTickets page
    @Binding var ticketStatus: Int
    
    var body: some View {
        NavigationView {
            VStack {
                MyTicketsHeader(ticketStatus: self.$ticketStatus)
                ScrollView {
                    VStack {
                        ForEach(viewModel.myTicketsArray_OPEN) { ticket in
                            NavigationLink(destination: Messenger(ticket: ticket)) {
                                MyTicketsRow(ticket: ticket)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                }
                TabsView(desiredTab: $desiredTab)
            }
            .edgesIgnoringSafeArea([.bottom])
            .navigationBarTitle(Text(""))
            .navigationBarHidden(true)
        }
        .onAppear(perform: {
            //self.viewModel.myTicketsArray_OPEN.removeAll()
            self.viewModel.getMyTickets_OPEN(agentID: session.session!.uid)
        })
    }
}

//struct MyOpenTickets_Previews: PreviewProvider {
//    static var previews: some View {
//        MyOpenTickets()
//    }
//}
