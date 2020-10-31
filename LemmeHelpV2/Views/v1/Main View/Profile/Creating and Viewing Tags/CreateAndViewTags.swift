////
////  CreateAndViewTags.swift
////  LemmeHelpV2
////
////  Created by Colin Power on 9/6/20.
////  Copyright © 2020 Colin Power. All rights reserved.
////
//
//import SwiftUI
//
//
////CANT FIGURE OUT HOW TO PASS THE UPDATED VIEWMODEL.KEYWORD TICKETS BACK TO MAIN VIEW
//struct TagButton: View {
//    var title:String
//
//    var body: some View {
//        Text(title)
//            .foregroundColor(Color.white)
//            .padding(12)
//            .background(RoundedRectangle(cornerRadius: 5).fill(Color.blue.opacity(0.7)))
//    }
//}
//        
//
//
//struct CreateAndViewTags: View {
//    @Environment(\.presentationMode) var presentationMode
//        
//    @ObservedObject private var viewModel = TicketsViewModel()
//    @State var searchedKeyword = ""
//    @State var keywordShowingTheseResults = ""
////    @State var listOfTickets = [Ticket]()
//    
//    func callDismiss() {
//        self.presentationMode.wrappedValue.dismiss()
//    }
//
//    
//    var body: some View {
//        VStack {
//            HStack {
//                Button(action: callDismiss) {
//                    Image(systemName: "chevron.left").font(.title)
//                }.padding(.leading, 18)
//                Spacer()
//            }
//            VStack {
//                Text("Tags currently in use").font(.headline).padding(.bottom,12)
//                HStack {
//                    Button(action: {
//                        self.viewModel.getTicketsForKeyword(keyword: "cancel")
//                        self.keywordShowingTheseResults = "CANCEL"
//                    }) {
//                        TagButton(title: "Cancel")
//                    }
//                    Spacer()
//                    Button(action: {
//                        self.viewModel.getTicketsForKeyword(keyword: "return")
//                        self.keywordShowingTheseResults = "RETURN"
//                    }) {
//                        TagButton(title: "Return")
//                    }
//                    Spacer()
//                    Button(action: {
//                        self.viewModel.getTicketsForKeyword(keyword: "shipping")
//                        self.keywordShowingTheseResults = "SHIPPING"
//                    }) {
//                        TagButton(title: "Shipping")
//                    }
//                }.padding(.horizontal, 18)
//            }
//            HStack{
//                if (keywordShowingTheseResults != "") {
//                    Text("Tickets containing keyword: " + keywordShowingTheseResults).font(.headline).padding(.leading, 18)
//                    Spacer()
//                } else {
//                    Text("No keyword selected").font(.headline).padding(.leading, 18)
//                    Spacer()
//                }
//            }.padding(.vertical, 12)
//            .background(Color("newPrimaryColor"))
//            List {
//                ForEach(viewModel.keywordTickets) { ticket in
//                    Text(ticket.question)
//                }
//            }
//            HStack {
//                TextField("Search for tickets with keyword", text: $searchedKeyword)
//                .padding()
//                .background(RoundedRectangle(cornerRadius: 5).strokeBorder(Color.blue, lineWidth: 1))
//                Button(action: {
//                    self.viewModel.getTicketsForKeyword(keyword: self.searchedKeyword.lowercased())
//                    self.keywordShowingTheseResults = self.searchedKeyword.uppercased()
//                    self.searchedKeyword = ""
//                }) {
//                    Text("Search")
//                }
//            }.padding(.bottom, 60)
//            .padding(.top, 8)
//            .padding(.horizontal,18)
//            .background(Color("newPrimaryColor")).edgesIgnoringSafeArea(.all)
//        }
//    }
//}
//
////struct CreateAndViewTags_Previews: PreviewProvider {
////    static var previews: some View {
////        CreateAndViewTags()
////    }
////}
