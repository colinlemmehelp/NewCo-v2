//
//  Messaging.swift
//  LemmeHelpV2
//
//  Created by Colin Power on 10/22/20.
//  Copyright © 2020 Colin Power. All rights reserved.
//

import SwiftUI

struct Messenger: View {
    //Use the environment variable to check for signout etc.
    @EnvironmentObject var session: SessionStore
    
    //Use the var to pass along the specific ticket to this messenger window
    @State var ticket: Ticket
    
    //Observe the MessagesViewModel to get the latest ones
    @ObservedObject var messageViewModel = MessageViewModel()
    
    
    
    var body: some View {
        VStack {
            MessageHeader(ticket: ticket)
            ScrollView {
                VStack {
                    ForEach(self.messageViewModel.messages) { message in
                        MessageBubble(message: message)
                        }
                    AutotagBubble(ticket: ticket)
                    }
                }
                .navigationBarTitle("Bonobos #3601", displayMode: .inline)
                .edgesIgnoringSafeArea([.bottom])
            MagicTextField(ticket: ticket)
        }
            .onAppear(perform: {
                self.messageViewModel.getAllMessagesForTicket(ticket_reference: self.ticket.ticket_reference)
            })
    }
}

//struct Messenger_Previews: PreviewProvider {
//    static var previews: some View {
//        Messaging(ticket: .constan)
//    }
//}
