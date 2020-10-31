//
//  OpenTickets.swift
//  LemmeHelpV2
//
//  Created by Colin Power on 10/22/20.
//  Copyright © 2020 Colin Power. All rights reserved.
//

import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift

struct OpenTickets: View {
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
                        ForEach(viewModel.tickets) { ticket in
                            NavigationLink(destination: Messenger(ticket: ticket)) {
                                OpenTicketsRow(ticket: ticket)
                            }.buttonStyle(PlainButtonStyle())
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
            self.viewModel.getAllTickets()
        })
        //can't figure out how to detach listener??
//        .onDisappear(perform: {
//            let listener = self.viewModel.db.collection("tickets").
//        })
        
    }
}

//struct OpenTickets_Previews: PreviewProvider {
//    static var previews: some View {
//        OpenTickets(desiredTab: .constant(.openTickets))
//    }
//}
