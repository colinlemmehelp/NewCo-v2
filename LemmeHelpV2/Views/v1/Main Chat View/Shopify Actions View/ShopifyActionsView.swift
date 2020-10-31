//
//  ShopifyActionsView.swift
//  LemmeHelpV2
//
//  Created by Colin Power on 8/28/20.
//  Copyright © 2020 Colin Power. All rights reserved.
//

import SwiftUI

struct ShopifyActionsView: View {
    @Binding var bindingExample: String

//    @Binding var module: ChatView.SelectedModule
//    @Binding var response: String
//    @Binding var ticketID: String
    
    var body: some View {
        VStack {
            HStack {
                Text("< Order").font(.footnote).foregroundColor(Color.gray)
                Spacer()
                Text("Actions").font(.footnote).foregroundColor(Color.black)
                Spacer()
            }.padding(.horizontal, 12)
//            ChatModuleSwitcher(module: $module)
            VStack {
                Text("Refunds")
                VStack {
                    Text("Refund Entire Order")
                    Text("Refund Shipping")
                    Text("Refund Certain Amount")
                }
                Text("Cancellations")
                VStack {
                    Text("Cancel Entire Order")
                    Text("Cancel Partial Order")
                }
                Text("Updates")
                VStack {
                    Text("Update Card")
                    Text("Update Address")
                }
            }
            Spacer()
        }
//        .gesture(DragGesture(minimumDistance: 3.0, coordinateSpace: .local).onEnded({
//            value in
//            print(value.translation)
//            
//            if value.translation.width > 0 && value.translation.height > -30 && value.translation.height < 30 {
//                self.module = .orderDetailsView
//            }
//        })
//        )
    }
}

//struct ShopifyActionsView_Previews: PreviewProvider {
//    static var previews: some View {
//        ShopifyActionsView()
//    }
//}
