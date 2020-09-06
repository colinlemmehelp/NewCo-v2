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

struct TicketView: View {
    @EnvironmentObject var session: SessionStore
        
    func getUser() {
        session.listen()
    }
        
    @State var selection: SelectedTab = .newTicketsTab
    
    enum SelectedTab: Hashable {
        case newTicketsTab
        case myTicketsTab
        case profileTab
    }
    
    func useSelectedView(selection: SelectedTab) -> AnyView {
        switch selection {
            case .newTicketsTab: return AnyView(NewTicketsView(selection: $selection))
            case .myTicketsTab: return AnyView(MyTicketsView(selection: $selection))
            case .profileTab: return AnyView(ProfileView(selection: $selection))
        }
    }
    
    /// HOW TO TALK TO DIALOGFLOW!!
    //https://fireship.io/lessons/build-a-chatbot-with-dialogflow/
    
    //BUILD CHARTS FROM FIREBASE DATA
    //https://www.youtube.com/watch?v=Ga0vrqed6Ho
    
    
    //ADD FLOATING ICON FOR QUICK ACTIONS!!
    //https://www.youtube.com/watch?v=JFRtQS-V5YY
    //ideas for listview design
    //https://www.google.com/search?q=best+listview+design+&tbm=isch&ved=2ahUKEwjm8tTq5rzrAhWVl54KHW1NCSYQ2-cCegQIABAA&oq=best+listview+design+&gs_lcp=CgNpbWcQAzICCAAyBAgAEB4yBAgAEBg6BAgjECc6BQgAELEDOggIABCxAxCDAToKCAAQsQMQgwEQQzoECAAQQzoHCAAQsQMQQ1CF7wxY24cNYJuJDWgBcAB4AIABdogB9Q6SAQQyMC4ymAEAoAEBqgELZ3dzLXdpei1pbWfAAQE&sclient=img&ei=Z2VIX6ajOZWv-gTtmqWwAg&bih=744&biw=1370&hl=en#imgrc=z42EXVzpn4GJuM
    
    var body: some View {
        //create a group where you require getUser call first
        Group {
            //check if there's a session.. redirect to login if not
            if (session.session != nil) {
                //choose which view depending on selection
                VStack {
                    useSelectedView(selection: self.selection)                    
                }
                .navigationBarTitle(Text(""))
                .navigationBarHidden(true)
            }
            else {
                    LoginView()
                }
        }
        .edgesIgnoringSafeArea(.all)
        .onAppear(perform: {
            self.getUser()
            })
    }
}


#if DEBUG
struct TicketView_Previews: PreviewProvider {
    static var previews: some View {
        TicketView().environmentObject(SessionStore())
    }
}
#endif

