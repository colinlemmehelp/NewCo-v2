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
            Spacer()
            HStack {
                Spacer()
                Text("Select a tag").font(.largeTitle)
                Spacer()
            }
            HStack {
                Button(action: {
                    self.viewModel.updateAgentTag(ticketID: self.ticketID, agentTag: "return")
                    self.showingDetail.toggle()
                }) {
                    Text("return").font(.title)
                        .padding(12)
                        .foregroundColor(Color.blue)
                        .background(RoundedRectangle(cornerRadius: 7).fill(Color.blue.opacity(0.1)))
                        .background(RoundedRectangle(cornerRadius: 7).strokeBorder(Color.blue, lineWidth: 2))
                }
                Spacer()
                Button(action: {
                    self.viewModel.updateAgentTag(ticketID: self.ticketID, agentTag: "cancel")
                    self.showingDetail.toggle()
                }) {
                    Text("cancel").font(.title)
                        .padding(12)
                        .foregroundColor(Color.blue)
                        .background(RoundedRectangle(cornerRadius: 7).fill(Color.blue.opacity(0.1)))
                        .background(RoundedRectangle(cornerRadius: 7).strokeBorder(Color.blue, lineWidth: 2))
                }
                Spacer()
                Spacer()
            }.padding(.horizontal, 30)
                .padding(.top, 40)
                .padding(.bottom, 20)
            
            HStack {
                Button(action: {
                    self.viewModel.updateAgentTag(ticketID: self.ticketID, agentTag: "shipping")
                    self.showingDetail.toggle()
                }) {
                    Text("shipping").font(.title)
                        .padding(12)
                        .foregroundColor(Color.blue)
                        .background(RoundedRectangle(cornerRadius: 7).fill(Color.blue.opacity(0.1)))
                        .background(RoundedRectangle(cornerRadius: 7).strokeBorder(Color.blue, lineWidth: 2))
                }
                Spacer()
            }.padding(.horizontal, 30)
            Spacer()
            Spacer()

        }
        
    }
}

struct AddTagView_Previews: PreviewProvider {
    static var previews: some View {
        AddTagView(ticketID: .constant("abc123"), showingDetail: .constant(true))
    }
}
