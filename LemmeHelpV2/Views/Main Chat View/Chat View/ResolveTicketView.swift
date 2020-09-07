//
//  ResolveTicketView.swift
//  LemmeHelpV2
//
//  Created by Colin Power on 9/6/20.
//  Copyright © 2020 Colin Power. All rights reserved.
//

import SwiftUI

struct ResolveTicketView: View {
    @ObservedObject private var viewModel = TicketsViewModel()
    @Binding var ticketID:String
    @Binding var showingResolve:Bool
    
    var body: some View {
        VStack {
            Button(action: {
                self.viewModel.updateAgentTag(ticketID: self.ticketID, agentTag: "return")
                self.showingResolve.toggle()
            }) {
                Text("return")
            }
        }
        
    }
}

struct ResolveTicketView_Previews: PreviewProvider {
    static var previews: some View {
        ResolveTicketView(ticketID: .constant("abc123"), showingResolve: .constant(true))
    }
}
