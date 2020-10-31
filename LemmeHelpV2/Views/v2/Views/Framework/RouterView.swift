

//
//  TicketView.swift
//  LemmeHelpV2
//
//  Created by Colin Power on 8/5/20.
//  Copyright © 2020 Colin Power. All rights reserved.
//

import SwiftUI
import Firebase
import Combine

struct RouterView: View {
    @EnvironmentObject var session: SessionStore
    
    @ObservedObject var viewModel = TicketViewModel()
        
    func getUser() {
        session.listen()
    }
    
    //Initialize the router on the OpenTickets page (switch to MyTickets page in the future)
    @State var desiredTab: tabChoices = .openTickets

    enum tabChoices: Hashable {
        case openTickets
        case myTickets
        case profile
    }

    func switchToTab(desiredTab: tabChoices) -> AnyView {
        switch desiredTab {
            case .openTickets: return AnyView(OpenTickets(desiredTab: $desiredTab))
            case .myTickets: return AnyView(MyTickets(desiredTab: $desiredTab))
            case .profile: return AnyView(Profile(desiredTab: $desiredTab))
        }
    }
    
    
    
    var body: some View {
 
        //create a group where you require getUser call first
        Group {
            //check if there's a session.. redirect to login if not
            if (session.session != nil) {
                //choose which view depending on selection
                VStack {
                    switchToTab(desiredTab: self.desiredTab)
                }
            } else {
                LoginView()
            }
        }
        .onAppear(perform: {
            self.getUser()
        })
    }
}


//                    List(viewModel.tickets) { ticket in
//                        NewTicketRow(ticket: ticket)
//                    }
//                    Button(action: {
//                        print(viewModel.tickets.count)
//                    }, label: {
//                        Text("click here")
//                    })


//struct NewTicketRow: View {
//    var ticket: Ticket
//    var body: some View {
//        VStack(alignment: .leading) {
//            Text(ticket.customer_email)
//        }
//    }
//}





/// HOW TO TALK TO DIALOGFLOW!!
//https://fireship.io/lessons/build-a-chatbot-with-dialogflow/

//BUILD CHARTS FROM FIREBASE DATA
//https://www.youtube.com/watch?v=Ga0vrqed6Ho


//ADD FLOATING ICON FOR QUICK ACTIONS!!
//https://www.youtube.com/watch?v=JFRtQS-V5YY
//ideas for listview design
//https://www.google.com/search?q=best+listview+design+&tbm=isch&ved=2ahUKEwjm8tTq5rzrAhWVl54KHW1NCSYQ2-cCegQIABAA&oq=best+listview+design+&gs_lcp=CgNpbWcQAzICCAAyBAgAEB4yBAgAEBg6BAgjECc6BQgAELEDOggIABCxAxCDAToKCAAQsQMQgwEQQzoECAAQQzoHCAAQsQMQQ1CF7wxY24cNYJuJDWgBcAB4AIABdogB9Q6SAQQyMC4ymAEAoAEBqgELZ3dzLXdpei1pbWfAAQE&sclient=img&ei=Z2VIX6ajOZWv-gTtmqWwAg&bih=744&biw=1370&hl=en#imgrc=z42EXVzpn4GJuM
