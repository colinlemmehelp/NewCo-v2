////
////  ConfirmTagView.swift
////  LemmeHelpV2
////
////  Created by Colin Power on 8/28/20.
////  Copyright © 2020 Colin Power. All rights reserved.
////
//
//import SwiftUI
//
//struct YesNoButtons: View {
//    var title:String
//
//    var body: some View {
//        Text(title)
//            .fontWeight(.semibold)
//            .foregroundColor(Color.white)
//            .padding(.horizontal, 30)
//            .padding(.vertical, 8)
//            .background(RoundedRectangle(cornerRadius: 5).fill(Color.blue))
//            .shadow(radius: 5)
//    }
//}
//
//
//struct ConfirmTagView: View {
//    
//    @ObservedObject private var viewModel = TicketsViewModel()
//    @Binding var ticketID:String
//    @Binding var autoTag:String
//    
//    var body: some View {
//        VStack (alignment: .center) {
//            HStack {
//                //Image(systemName: "hare.fill").foregroundColor(Color.blue)
//                Text("Suggested tag:")
//                    .foregroundColor(Color.gray)
//                    .padding(.trailing, 20)
//                Text(self.autoTag)
//                    .font(.body)
//                    .padding(12)
//                    .foregroundColor(Color.blue.opacity(0.8))
//                    .background(RoundedRectangle(cornerRadius: 20).strokeBorder(Color.blue, lineWidth: 2))
//                    .background(RoundedRectangle(cornerRadius: 20).fill(Color.blue.opacity(0.1)))
//            }.padding(.bottom, 20)
//            HStack {
//                Spacer(minLength: 60)
//                VStack(alignment: .trailing) {
//                    HStack {
//                        Spacer()
//                        Button(action: {
//                            self.viewModel.respondToAutoTag(ticketID: self.ticketID, isAutoTagCorrect: false, agentTag: "")
//                        }) {
//                            YesNoButtons(title: "No")
//                        }
//                        Spacer()
//                        Button(action: {
//                            self.viewModel.respondToAutoTag(ticketID: self.ticketID, isAutoTagCorrect: true, agentTag: self.autoTag)
//                        }) {
//                            YesNoButtons(title: "Yes")
//                        }
//                        Spacer()
//                    }.padding(.top, 18)
//                }.padding(.trailing, 18)
//            }
//        }
//    }
//}
//
////struct ConfirmTagView_Previews: PreviewProvider {
////    static var previews: some View {
////        ConfirmTagView()
////    }
////}
