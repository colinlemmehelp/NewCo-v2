//
//  EnterAResponseView.swift
//  LemmeHelpV2
//
//  Created by Colin Power on 8/27/20.
//  Copyright © 2020 Colin Power. All rights reserved.
//

import SwiftUI
import Combine

struct EnterAResponseView: View {
    @EnvironmentObject var session: SessionStore
    
    @ObservedObject private var viewModel = ChatsViewModel()
    @ObservedObject private var ticketsViewModel = TicketsViewModel()
    
    
    @Binding var response:String
    @Binding var ticketID:String
    
    func sendResponse() {
          self.viewModel.addChat(ticketID: ticketID, chat: self.response, agentID: session.session!.uid)
          self.ticketsViewModel.updateTicketWithLatestResponse(ticketID: ticketID, latestMessage: self.response, agentID: self.session.session!.uid)
          self.response = ""
        
    }
    
    
    var body : some View {
        VStack {
            ScrollView(.horizontal) {
                HStack(spacing: 10) {
                    //Create initial spacing
                    Text("    ")
                    
                    //Docs
                    Text("View docs").font(.subheadline).foregroundColor(Color.purple)
                    .padding(4)
                    .background(RoundedRectangle(cornerRadius: 5).fill(Color.purple.opacity(0.2)))
                    .background(RoundedRectangle(cornerRadius: 5).strokeBorder(Color.purple, lineWidth: 2))
                    
                    //Snippets
                    Text("Insert snippet").font(.subheadline).foregroundColor(Color.green)
                    .padding(4)
                    .background(RoundedRectangle(cornerRadius: 5).fill(Color.green.opacity(0.2)))
                    .background(RoundedRectangle(cornerRadius: 5).strokeBorder(Color.green, lineWidth: 2))
                    
                    //Autocompletion
                    Text("Try auto answer").font(.subheadline).foregroundColor(Color.blue)
                    .padding(4)
                    .background(RoundedRectangle(cornerRadius: 5).fill(Color.blue.opacity(0.2)))
                    .background(RoundedRectangle(cornerRadius: 5).strokeBorder(Color.blue, lineWidth: 2))
                    
                    //Resolve
                    Text("Resolve ticket").font(.subheadline).foregroundColor(Color.red)
                    .padding(4)
                    .background(RoundedRectangle(cornerRadius: 5).fill(Color.red.opacity(0.2)))
                    .background(RoundedRectangle(cornerRadius: 5).strokeBorder(Color.red, lineWidth: 2))
                    }
                }
            HStack {
                TextField("Enter a response", text: self.$response)
                    .font(.body)
                    .padding(12)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                    .padding(.trailing, 8)
                Button(action: self.sendResponse, label: {
                    Image(systemName: "arrow.up.circle.fill").font(.title)
                })
            }.padding(.horizontal)
            .padding(.vertical, 8)
        }
        .padding(.bottom, 60)
        .padding(.top, 8)
        .background(Color("newPrimaryColor")).edgesIgnoringSafeArea(.all)
        
    }
}

struct EnterAResponseView_Previews: PreviewProvider {
    static var previews: some View {
        EnterAResponseView(response: .constant("test"), ticketID: .constant("ticketIDexample001"))
    }
}
