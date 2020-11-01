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
    
//    //Observe the Tickets ViewModel to get the latest tix
//    @ObservedObject var viewModel = TicketViewModel()
    
    //Initialize the router on the MyTickets page
    @State var ticketStatus = 0
    
    var body: some View {
        if ticketStatus == 0 {
            MyOpenTickets(desiredTab: self.$desiredTab, ticketStatus: self.$ticketStatus)
        } else {
            MyClosedTickets(desiredTab: self.$desiredTab, ticketStatus: self.$ticketStatus)
        }
        
    }
}

//struct MyTickets_Previews: PreviewProvider {
//    static var previews: some View {
//        MyTickets(desiredTab: .constant(.profile))
//    }
//}
