//
//  ChatThreadView.swift
//  LemmeHelpV2
//
//  Created by Colin Power on 8/28/20.
//  Copyright © 2020 Colin Power. All rights reserved.
//

import SwiftUI

struct ChatThreadView: View {
    @EnvironmentObject var session: SessionStore

    @ObservedObject private var viewModel = ChatsViewModel()

//    @Binding var module: ChatView.SelectedModule
    @Binding var response: String
    @Binding var ticketID: String
    @Binding var autoTag: String
    @Binding var agentTag: String
    @Binding var isAutoTagCorrect: Bool
    
    @State var selected = 0
    
    @State var keyboardOffset:CGFloat = 0
    
    
    var body: some View {
        ZStack(alignment: .bottom){
            FloatingTB(selected: self.$selected, ticketID: $ticketID).offset(x: 160, y: -170).zIndex(1)
            
            VStack {
                HStack {
                    Text("       ")
                    Spacer()
                    Text("Chat").font(.footnote).foregroundColor(Color.black)
                    Spacer()
                    Text("Order >").font(.footnote).foregroundColor(Color.gray)
                }.padding(.horizontal, 12)
                GeometryReader { geometry in
                    ScrollView {
                        VStack(spacing: 0) {
                            ForEach(self.viewModel.chats) { chat in
                                ChatRow(name: chat.name, chat: chat.chat, timestamp: chat.timestamp)
                            }
                            Spacer()
                        }
                        Rectangle().frame(width: geometry.size.width, height: 0.01)
                    }
                }
//                .gesture(DragGesture(minimumDistance: 3.0, coordinateSpace: .local).onEnded({
//                    value in
//                    print(value.translation)
//
//                    if value.translation.width < 0 && value.translation.height > -30 && value.translation.height < 30 {
//                        self.module = .orderDetailsView
//                    }
//                })
//                )
                if ((self.autoTag != "") && (self.isAutoTagCorrect != false) && (self.agentTag == "")) {
                    ConfirmTagView(ticketID: $ticketID, autoTag: $autoTag).padding(32).background(Color("newPrimaryColor"))
                }
                EnterAResponseView(response: $response, ticketID: $ticketID)
            }
        }
        .offset(y: -self.keyboardOffset)
        .onAppear(perform: {
            NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { (noti) in
                
                let keyboardOffset = noti.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
                let height = keyboardOffset.height
                
                self.keyboardOffset = height
            }
            
            NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { (noti) in
               
                self.keyboardOffset = 0
            }
            
            
            self.viewModel.fetchChat(ticketID: self.ticketID)
        })
    }
}

struct ChatThreadView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
