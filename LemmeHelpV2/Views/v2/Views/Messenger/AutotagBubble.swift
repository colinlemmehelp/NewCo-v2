//
//  AutotagBubble.swift
//  LemmeHelpV2
//
//  Created by Colin Power on 10/26/20.
//  Copyright © 2020 Colin Power. All rights reserved.
//

import SwiftUI

struct AutotagBubble: View {
    //Observe the Tickets ViewModel to get the latest tix
    @ObservedObject var viewModel = TicketViewModel()
    
    var ticket: Ticket
    
    var body: some View {
        if ((!ticket.tag_isDismissed) && (ticket.tag_automatic != "")) {
            VStack(alignment: .leading) {
                HStack(alignment: .center) {
                    Text("USE AUTOTAG:")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.black.opacity(0.7))
                        .padding(.trailing, 8)
                    HStack {
                        Image(systemName: "tag")
                        Text(ticket.tag_automatic).padding(.trailing, 4)
                            }.padding(4)
                            .foregroundColor(Color.blue)
                            .background(RoundedRectangle(cornerRadius: 7).fill(Color.blue.opacity(0.1)))
                            .background(RoundedRectangle(cornerRadius: 7).strokeBorder(Color.blue, lineWidth: 1))
                    Spacer()
                    Button(action: {
                        self.viewModel.tag_confirmAutoTag(ticket_reference: ticket.ticket_reference, ticket_tag: ticket.tag_automatic)
                    }) {
                        Text("YES")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.blue)
                    }.padding(.trailing, 16)
                    
                    Button(action: {
                        self.viewModel.tag_dismissAutoTag(ticket_reference: ticket.ticket_reference)
                    }) {
                        Text("NO")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.blue)
                    }.padding(.trailing, 8)
                }
                HStack {
                    Spacer()
                    Text("(i) Automatic suggestion")
                        .font(.caption)
                        .fontWeight(.light)
                        .padding(.trailing, 16)
                        .padding(.top, 8)
                }
            }.padding(8)
            .background(RoundedRectangle(cornerRadius: 7).fill(Color.gray.opacity(0.1)))
            .padding(.top, 32)
        } else {
            Text("")
        }
    }
}

//struct AutotagBubble_Previews: PreviewProvider {
//    static var previews: some View {
//        AutotagBubble()
//    }
//}
