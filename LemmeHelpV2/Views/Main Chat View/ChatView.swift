//
//  ChatView.swift
//  LemmeHelpV2
//
//  Created by Colin Power on 8/22/20.
//  Copyright © 2020 Colin Power. All rights reserved.
//

import SwiftUI
import Firebase
import Combine

struct ChatView: View {
    @EnvironmentObject var session: SessionStore
    @ObservedObject private var viewModel = ChatsViewModel()
    @ObservedObject private var ticketsViewModel = TicketsViewModel()
    

    @State var bindingExample : String = "bindingID"
    @State var response : String = ""
    
    @State var ticketID : String = ""
    @State var autoTag : String = ""
    @State var agentTag : String = ""
    @State var isAutoTagCorrect : Bool = false
        
    var customerName : String = "Get rid of this"
    
    @State var module: SelectedModule = .chatThreadView
    

    enum SelectedModule: Hashable {
        case chatThreadView
        case orderDetailsView
        case shopifyActionsView
    }
    
//    func useSelectedModule(module: SelectedModule) -> AnyView {
//        switch module {
//        case .chatThreadView: return AnyView(ChatThreadView(module: $module, response: $response, ticketID: $ticketID))
//        case .orderDetailsView: return AnyView(OrderDetailsView(module: $module, response: $response, ticketID: $ticketID))
//        case .shopifyActionsView: return AnyView(ShopifyActionsView(module: $module, response: $response, ticketID: $ticketID))
//        }
//    }
    
    
    func resolveTicket() {
    }
    //drag up menu (if we want that)
    //https://www.youtube.com/watch?v=LVoldWPWTOE

    var body: some View {
        VStack(alignment: .center) {
            //to scroll automatically to a position, use ios 14
            //https://stackoverflow.com/questions/57121782/scroll-swiftui-list-to-new-selection
            
            ChatHeaderView(ticketID: $ticketID, agentTag: ticketsViewModel.ticketByID.agentTag, companyName: "Bonobos", name: ticketsViewModel.ticketByID.name)
            ContentView(bindingExample: $bindingExample, response: $response, ticketID: $ticketID, autoTag: $autoTag, agentTag: $agentTag, isAutoTagCorrect: $isAutoTagCorrect)
//            Spacer()
//            ContentView(module: $module, response: $response, ticketID: $ticketID)
//            Spacer()
//            useSelectedModule(module: self.module)

        }.onAppear(perform: {
            self.ticketsViewModel.getTicketByID(ticketID: self.ticketID)
        })
        .navigationBarTitle(Text(""))
        .navigationBarHidden(true)
    }
}
    

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(response: "example response", ticketID: "ticket001")
    }
}



//List {
//    ForEach(viewModel.chats) { chat in
//        ChatRow(name: chat.name, chat: chat.chat, timestamp: chat.timestamp)
//    }
//    if (viewModel.chats.count == 1) {
//        SuggestedArticleRow()
//        SuggestedResponseRow()
//    }
//    Spacer()
//}
//EnterAResponseView(response: $response, ticketID: $ticketID)
