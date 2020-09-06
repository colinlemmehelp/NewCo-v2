//
//  ChatModuleSwitcher.swift
//  LemmeHelpV2
//
//  Created by Colin Power on 8/28/20.
//  Copyright © 2020 Colin Power. All rights reserved.
//

import SwiftUI

struct ChatModuleSwitcher: View {
    
    @EnvironmentObject var session: SessionStore
    
    @Binding var module: ChatView.SelectedModule
    
    func switchToChatThread() {
        self.module = .chatThreadView
    }
    
    func switchToOrderDetails() {
        self.module = .orderDetailsView
    }
    
    func switchToShopifyActions() {
        self.module = .shopifyActionsView
    }
    
    //HOW TO SWIPE BETWEEN VIEWS LIKE SNAPSHAT / ETC
    //https://www.youtube.com/watch?v=hr_B03mabYo
    //https://developer.apple.com/documentation/uikit/uipageviewcontroller
    
    var body: some View {
        VStack {
            ScrollView(.horizontal) {
                HStack(spacing: 10) {
                    //Create initial spacing
                    Spacer()
                    Button(action: self.switchToChatThread, label: {
                        if (module.self == .chatThreadView) {
                            Text("   Chat   ").font(.footnote).fontWeight(.semibold).foregroundColor(Color.blue)
                        } else {
                            Text("   Chat   ").font(.footnote).fontWeight(.semibold).foregroundColor(Color.gray)
                        }
                    })
                    Spacer()
                    Button(action: self.switchToOrderDetails, label: {
                        if (module.self == .orderDetailsView) {
                            Text("Order").font(.footnote).fontWeight(.semibold).foregroundColor(Color.blue)
                        } else {
                            Text("Order").font(.footnote).fontWeight(.semibold).foregroundColor(Color.gray)
                        }
                    })
                    Spacer()
                    Button(action: self.switchToShopifyActions, label: {
                        if (module.self == .shopifyActionsView) {
                            Text("Shopify").font(.footnote).fontWeight(.semibold).foregroundColor(Color.blue)
                        } else {
                            Text("Shopify").font(.footnote).fontWeight(.semibold).foregroundColor(Color.gray)
                        }
                    })
                    Spacer()
                }
            }
        }
    }
}

struct ChatModuleSwitcher_Previews: PreviewProvider {
    static var previews: some View {
        ChatModuleSwitcher(module: .constant(.chatThreadView))
    }
}

//struct ChatModuleSwitcher_Previews: PreviewProvider {
//    static var previews: some View {
//        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
//    }
//}
