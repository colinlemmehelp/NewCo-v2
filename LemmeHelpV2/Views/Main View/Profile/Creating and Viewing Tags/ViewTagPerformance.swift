//
//  ViewTagPerformance.swift
//  LemmeHelpV2
//
//  Created by Colin Power on 9/6/20.
//  Copyright © 2020 Colin Power. All rights reserved.
//

import SwiftUI

struct TagPerformanceRow: View {
    var text: String
    var autoTag: String
    var agentTag: String
    var isCorrect: Bool
    
    var body: some View {
        HStack {
            Text(text)
            Spacer()
            Text(autoTag)
            Text(agentTag)
            if isCorrect {
                Image(systemName: "checkmark").foregroundColor(Color.green)
            } else {
                Image(systemName: "xmark.circle.fill").foregroundColor(Color.red)
            }
        }
    }
}


struct ViewTagPerformance: View {
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject private var viewModel = TicketsViewModel()
    
    func callDismiss() {
        self.presentationMode.wrappedValue.dismiss()
    }
    

    
    var body: some View {
        VStack {
            HStack {
                Button(action: callDismiss) {
                    Image(systemName: "chevron.left").font(.title)
                }.padding(.leading, 18)
                Spacer()
            }
            Text("Select a tag to see its performance").padding(.bottom, 18)
            HStack {
                Button(action: {
                    self.viewModel.getTicketsForAutoTag(autoTag: "return")
                    self.viewModel.getTicketsForAgentTag(agentTag: "return")
                }) {
                    TagButton(title: "Return")
                }
                Button(action: {
                    self.viewModel.getTicketsForAutoTag(autoTag: "cancel")
                    self.viewModel.getTicketsForAgentTag(agentTag: "cancel")
                }) {
                    TagButton(title: "Cancel")
                }
                Button(action: {
                    self.viewModel.getTicketsForAutoTag(autoTag: "shipping")
                    self.viewModel.getTicketsForAgentTag(agentTag: "shipping")
                }) {
                    TagButton(title: "Shipping")
                }
            }.padding(.bottom, 18)
            HStack {
                Text("Question").padding(.leading, 20)
                Spacer()
                Text("Auto")
                Text("Agent")
                Text("Result").padding(.trailing, 6)
            }.font(.subheadline)
            List {
                ForEach(viewModel.autoTagTickets) { ticket in
                    HStack{
                        TagPerformanceRow(text: ticket.question, autoTag: ticket.autoTag, agentTag: ticket.agentTag, isCorrect: ticket.isAutoTagCorrect)
                    }
                }
                ForEach(viewModel.agentTagTickets) { ticket in
                    HStack{
                        TagPerformanceRow(text: ticket.question, autoTag: ticket.autoTag, agentTag: ticket.agentTag, isCorrect: ticket.isAutoTagCorrect)
                    }
                }
            }
        }
    }
}

struct ViewTagPerformance_Previews: PreviewProvider {
    static var previews: some View {
        ViewTagPerformance()
    }
}
