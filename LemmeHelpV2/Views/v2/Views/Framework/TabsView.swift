//
//  TabsView.swift
//  LemmeHelpV2
//
//  Created by Colin Power on 10/22/20.
//  Copyright © 2020 Colin Power. All rights reserved.
//

import SwiftUI

struct TabsView: View {

    @EnvironmentObject var session: SessionStore
    
    @Binding var desiredTab: RouterView.tabChoices

    
    func switchToOpenTickets() {
        self.desiredTab = .openTickets
    }

    func switchToMyTickets() {
        self.desiredTab = .myTickets
    }

    func switchToProfile() {
        self.desiredTab = .profile
    }

    var body: some View {
            HStack {
                Spacer()
                Button(action: self.switchToOpenTickets, label: {
                    if (desiredTab.self == .openTickets) {
                        Text("New").font(.title).foregroundColor(Color.blue)
                    } else {
                        Text("New").font(.title).foregroundColor(Color.gray)
                    }
                })
                Spacer()
                Button(action: self.switchToMyTickets, label: {
                    if (desiredTab.self == .myTickets) {
                        Text("Mine").font(.title).foregroundColor(Color.blue)
                    } else {
                        Text("Mine").font(.title).foregroundColor(Color.gray)
                    }
                })
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Button(action: self.switchToProfile, label: {
                    if (desiredTab.self == .profile) {
                        Image(systemName: "person.fill").font(.title).foregroundColor(Color.blue)
                    } else {
                        Image(systemName: "person.fill").font(.title).foregroundColor(Color.gray)
                    }
                })
                Spacer()
        }.padding(.top, 10)
        .padding(.bottom, 60)
        .edgesIgnoringSafeArea([.top, .bottom])
    }
}

struct TabsView_Previews: PreviewProvider {
    static var previews: some View {
        TabsView(desiredTab: .constant(.profile))
    }
}
