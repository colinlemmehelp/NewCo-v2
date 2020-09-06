//
//  BottomTabView.swift
//  LemmeHelpV2
//
//  Created by Colin Power on 8/27/20.
//  Copyright © 2020 Colin Power. All rights reserved.
//

import SwiftUI

struct BottomTabView: View {
    
    @EnvironmentObject var session: SessionStore
    
    @Binding var selection: TicketView.SelectedTab
    
    func switchToNewTickets() {
        self.selection = .newTicketsTab
    }
    
    func switchToMyTickets() {
        self.selection = .myTicketsTab
    }
    
    func switchToProfile() {
        self.selection = .profileTab
    }
    
    var body: some View {
            HStack {
                Spacer()
                Button(action: self.switchToNewTickets, label: {
                    if (selection.self == .newTicketsTab) {
                        Image(systemName: "envelope.badge").font(.title).foregroundColor(Color.blue)
                    } else {
                        Image(systemName: "envelope.badge").font(.title).foregroundColor(Color.gray)
                    }
                })
                Spacer()
                Button(action: self.switchToMyTickets, label: {
                    if (selection.self == .myTicketsTab) {
                        Image(systemName: "bubble.left.and.bubble.right").font(.title).foregroundColor(Color.blue)
                    } else {
                        Image(systemName: "bubble.left.and.bubble.right").font(.title).foregroundColor(Color.gray)
                    }
                })
                Spacer()
                Button(action: self.switchToProfile, label: {
                    if (selection.self == .profileTab) {
                        Image(systemName: "person").font(.title).foregroundColor(Color.blue)
                    } else {
                        Image(systemName: "person").font(.title).foregroundColor(Color.gray)
                    }
                })
                Spacer()
        }.padding(.top, 10)
        .padding(.bottom, 60)
    }
}

//struct TabView_Previews: PreviewProvider {
//    static var previews: some View {
//        BottomTabView()
//    }
//}
