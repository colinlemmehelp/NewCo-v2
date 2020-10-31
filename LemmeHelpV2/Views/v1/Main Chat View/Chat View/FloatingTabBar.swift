////
////  FloatingTabBar.swift
////  LemmeHelpV2
////
////  Created by Colin Power on 8/28/20.
////  Copyright © 2020 Colin Power. All rights reserved.
////
//
//import SwiftUI
//
//struct FloatingTabBar: View {
//    
//    @State var selected = -1
//    @Binding var ticketID: String
//
//    
//    var body: some View {
//        ZStack(alignment: .bottom) {
//            
//            VStack {
//                NavigationView {
//                    ScrollView(.vertical, showsIndicators: false) {
//                        VStack(spacing:15) {
//                            Image(systemName: "house").resizable().frame(height: 250).cornerRadius(15)
//                            Image(systemName: "gift").resizable().frame(height: 250).cornerRadius(15)
//                            Image(systemName: "house").resizable().frame(height: 250).cornerRadius(15)
//                            }.padding().background(Color.blue).edgesIgnoringSafeArea(.all)
//                    }
//                }
//            }
//            
//            FloatingTB(selected: self.$selected, ticketID: $ticketID).offset(x: 160, y: -140)
//        }
//    }
//}
//
//
//
//struct FloatingTB: View {
//    
//    @Binding var selected:Int
//    @Binding var ticketID: String
//    @State var expand = false
//    @State var showingDetail = false
//    @State var showingResolve = false
//    @State var showingSnippet = false
//    
//    var body: some View {
//        
//        VStack {
//            VStack {
//                
//                if !self.expand {
//                    Button(action: {
//                        self.expand.toggle()
//                    }) {
//                        Image(systemName: "bolt.fill").foregroundColor(.black).padding()
//                    }
//                } else {
//                    Button(action: {
//                        self.selected = 0
//                        self.showingResolve.toggle()
//                    }) {
//                        VStack{
//                            Image(systemName: "checkmark").padding(.horizontal)
//                            Text("Close").font(.caption)
//                        }.foregroundColor(self.selected == 0 ? .black : .gray)
//                    }.sheet(isPresented: $showingResolve) {
//                        ResolveTicketView(ticketID: self.$ticketID, showingResolve: self.$showingResolve)
//                    }
//                    
//                    Spacer(minLength: 16)
//                    
//                    Button(action: {
//                        self.selected = 2
//                        self.showingDetail.toggle()
//                    }) {
//                        VStack{
//                            Image(systemName: "tag").padding(.horizontal)
//                            Text("Tag").font(.caption)
//                        }.foregroundColor(self.selected == 2 ? .green : .gray)
//                    }.sheet(isPresented: $showingDetail) {
//                        AddTagView(ticketID: self.$ticketID, showingDetail: self.$showingDetail)
//                    }
//                    
//                    Spacer(minLength: 16)
//                    
//                    Button(action: {
//                        self.selected = 3
//                    }) {
//                        VStack{
//                            Image(systemName: "scissors").padding(.horizontal)
//                            Text("Snippet").font(.caption)
//                        }.foregroundColor(self.selected == 3 ? .blue : .gray)
//                    }
//                    
//                    Spacer(minLength: 16)
//
//                    
//                    Button(action: {
//                        self.selected = -1
//                        self.expand.toggle()
//                    }) {
//                        Image(systemName: "xmark").foregroundColor(self.selected == 0 ? .black : .gray).padding(.horizontal)
//                    }
//                }
//            }
//            .padding(.top, self.expand ? 32 : 4)
//            .padding(.bottom, self.expand ? 24 : 4)
//            .padding(.horizontal, self.expand ? 8 : 4)
//            .background(Color("newPrimaryColor"))
//            .clipShape(Capsule())
//            .frame(width: 36, height: 300, alignment: .bottom)
//            .padding(11)
//            .onLongPressGesture {
//                self.expand.toggle()
//            }
//            .animation(.interactiveSpring(response: 0.25, dampingFraction: 0.8, blendDuration: 0.6))
//        }
//    }
//}
