//
//  ResolveTicket.swift
//  LemmeHelpV2
//
//  Created by Colin Power on 10/31/20.
//  Copyright © 2020 Colin Power. All rights reserved.
//

import SwiftUI

struct ResolveTicket: View {
    
    //Observe the Tickets ViewModel to get the latest tix
    @ObservedObject var viewModel = TicketViewModel()
    
    var ticket: Ticket
    @Binding var showResolutionSheet:Bool
    
    var body: some View {
        NavigationView {
            VStack (alignment: .leading) {
                Text("Resolve this ticket after:")
                Text("1. You have solved the customer's problem")
                Text("2. You have asked if there is anything else you can help with")
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        viewModel.resolveTicket(ticket_reference: ticket.ticket_reference, state_rating: 4)
                        self.showResolutionSheet = false
                    }) {
                        Text("Resolve ticket")
                            .font(.headline)
                            .foregroundColor(Color.white)
                            .padding(.vertical, 16)
                            .padding(.horizontal, 32)
                            .background(RoundedRectangle(cornerRadius: 5).fill(Color.blue))
                        }
                    Spacer()
                }
                Spacer()
            }
            .navigationBarTitle("Resolve Ticket")
            .navigationBarItems(trailing: Button(action: {
                self.showResolutionSheet = false
            }) {
                Text("Done")
            })
        }
    }
}

//struct ResolveTicket_Previews: PreviewProvider {
//    static var previews: some View {
//        ResolveTicket()
//    }
//}
