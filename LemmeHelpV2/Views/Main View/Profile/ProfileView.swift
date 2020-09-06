//
//  ProfileView.swift
//  LemmeHelpV2
//
//  Created by Colin Power on 8/27/20.
//  Copyright © 2020 Colin Power. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var session: SessionStore
    
    @Binding var selection: TicketView.SelectedTab
    
    var profileButtons = ["account", "notifications", "settings", "help"]

    var body: some View {
        Group {
            NavigationView {
                VStack {
                    ProfileBannerView()
                    List {
                        Text("account")
                        Text("notifications")
                        Text("settings")
                        Text("help")
                        NavigationLink(destination: CreateAndViewTags()) {
                            Text("Create and view tags")
                        }
                        NavigationLink(destination: ViewTagPerformance()) {
                            Text("View tag performance")
                        }
                        Button(action: session.signOut) {
                            Text("Sign out")
                        }
                    }
                    BottomTabView(selection: $selection)
                }
                .navigationBarTitle("")
                .navigationBarHidden(true)
            }
        }.onAppear(perform: {
            print("back reloading this page again!")
            })
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(selection: .constant(.profileTab))
    }
}
