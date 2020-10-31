//
//  MyTickets.swift
//  LemmeHelpV2
//
//  Created by Colin Power on 10/22/20.
//  Copyright © 2020 Colin Power. All rights reserved.
//

import SwiftUI

struct MyTickets: View {
    //Use the environment variable to check for signout etc.
    @EnvironmentObject var session: SessionStore
    
    //Use the binding var to pass along to the TabsView so it can switch tabs
    @Binding var desiredTab: RouterView.tabChoices
    
    //Observe the Tickets ViewModel to get the latest tix
    @ObservedObject var viewModel = TicketViewModel()
    
    
    var body: some View {
        NavigationView {
            VStack {
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
            print(session.session!.uid)
            self.viewModel.myTicketsArray_OPEN.removeAll()
            self.viewModel.getMyTickets_OPEN(agentID: session.session!.uid)
        })
    }
}

//struct MyTickets_Previews: PreviewProvider {
//    static var previews: some View {
//        MyTickets(desiredTab: .constant(.profile))
//    }
//}
