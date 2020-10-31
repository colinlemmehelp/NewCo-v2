////
////  ChatHeaderView.swift
////  LemmeHelpV2
////
////  Created by Colin Power on 8/27/20.
////  Copyright © 2020 Colin Power. All rights reserved.
////
//
//import SwiftUI
//
//struct ChatHeaderView: View {
//    
//    @Environment(\.presentationMode) var presentationMode
//    @ObservedObject private var viewModel = TicketsViewModel()
//
//    @Binding var ticketID:String
//    var agentTag:String
//    var companyName:String
//    var name:String
//    
//    var pageName = "Page Name"
//    
//    func yesResponse() {
//    }
//    func noResponse() {
//    }
//    func callDismiss() {
//        self.presentationMode.wrappedValue.dismiss()
//    }
//    
//    
//    var body: some View {
//        VStack(alignment: .leading) {
//            //Text(pageName)
//            HStack {
//                Button(action: callDismiss) {
//                    Image(systemName: "chevron.left").font(.title)
//                }.padding(.trailing, 12)
//                HStack(alignment: .bottom) {
//                    VStack(alignment: .leading) {
//                        Text(companyName).foregroundColor(Color.gray).font(.body)
//                        Text(name).font(.title).fontWeight(.semibold)
//                    }
//                    Spacer()
//                }
//                VStack(alignment: .trailing) {
//                    HStack(alignment: .top) {
//                        Image(systemName: "flag").font(.headline)
//                            .foregroundColor(Color.red.opacity(0.5)).padding(.bottom, 12).padding(.trailing, 12)
//                        Image(systemName: "questionmark.circle").font(.headline)
//                            .foregroundColor(Color.red.opacity(0.5))
//                    }
//                    if (self.agentTag != "") {
//                        HStack {
//                            HStack {
//                                Image(systemName: "tag")
//                                Text(self.agentTag).padding(.trailing, 4)
//                            }.padding(5)
//                                .foregroundColor(Color.blue)
//                            .background(RoundedRectangle(cornerRadius: 7).fill(Color.blue.opacity(0.1)))
//                            .background(RoundedRectangle(cornerRadius: 7).strokeBorder(Color.blue, lineWidth: 2))
//                            Button(action: {
//                                self.viewModel.updateAgentTag(ticketID: self.ticketID, agentTag: "")
//                            }) {
//                                Image(systemName: "xmark").font(.headline).foregroundColor(Color.gray)
//                            }
//                        }
//                    } else {
//                        HStack {
//                            Spacer()
//                        }
//                    }
//                }
//            }.padding(.bottom, 12)
//        }
//        .padding(.top, 90)
//        .padding(.bottom, 12)
//        .padding(.horizontal, 12)
//        .background(Color("newPrimaryColor"))
//        
//    }
//}
//
//
////struct ChatHeaderView_Previews: PreviewProvider {
////    static var previews: some View {
////        ChatHeaderView()
////    }
////}
//
//
//
