//
//  AddTagView.swift
//  LemmeHelpV2
//
//  Created by Colin Power on 9/6/20.
//  Copyright © 2020 Colin Power. All rights reserved.
//

import SwiftUI

struct AddTagView: View {
    @ObservedObject private var viewModel = TicketsViewModel()
    @Binding var ticketID:String
    @Binding var showingDetail:Bool
    

    
    var body: some View {
        VStack {
            Button(action: {
                self.viewModel.updateAgentTag(ticketID: self.ticketID, agentTag: "return")
                self.showingDetail.toggle()
            }) {
                Text("return")
            }
            Button(action: {
                self.viewModel.updateAgentTag(ticketID: self.ticketID, agentTag: "cancel")
                self.showingDetail.toggle()
            }) {
                Text("cancel")
            }
            Button(action: {
                self.viewModel.updateAgentTag(ticketID: self.ticketID, agentTag: "shipping")
                self.showingDetail.toggle()
            }) {
                Text("shipping")
            }
        }
        
    }
}

//struct AddTagView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddTagView()
//    }
//}
