//
//  OrderDetailsView.swift
//  LemmeHelpV2
//
//  Created by Colin Power on 8/28/20.
//  Copyright © 2020 Colin Power. All rights reserved.
//

import SwiftUI

struct ItemOnOrderPage: View {
    var property:String
    var value:String

    var body: some View {
        HStack {
            Text(property)
            Text(value)
        }
    }
}


struct OrderDetailsView: View {
//    @Binding var module: ChatView.SelectedModule
//    @Binding var response: String
//    @Binding var ticketID: String
    @Binding var bindingExample: String
    @State private var searchedTicketID:String = ""
    
    //IDEAS
    //https://www.gorgias.com/blog/the-secret-to-delivering-personalized-support-at-scale
    
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Text("< Chat").font(.footnote).foregroundColor(Color.gray)
                    Spacer()
                    Text("Order").font(.footnote).foregroundColor(Color.black)
                    Spacer()
                    Text("Actions >").font(.footnote).foregroundColor(Color.gray)
                }.padding(.horizontal, 12)
                
                //ORDER lookup
                HStack {
                    TextField("Search using ticket ID", text: $searchedTicketID)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 5).strokeBorder(Color.blue, lineWidth: 1))
                    Spacer()
                    Text("Search").foregroundColor(Color.blue)
                }.padding()
                
                //Create the ORDER item
                VStack (alignment: .leading) {
                    HStack {
                        Image(systemName: "gift").font(.title).foregroundColor(Color.green).padding(.trailing, 20)
                        Text("Metadata").font(.title)
                        Spacer()
                    }
                    ItemOnOrderPage(property: "#          ", value: "0134359")
                    ItemOnOrderPage(property: "Name   ", value: "Alden Harwood")
                    ItemOnOrderPage(property: "Email   ", value: "alden@gmail.com")
                    ItemOnOrderPage(property: "Date    ", value: "09/01/20 3:45PM")
                    ItemOnOrderPage(property: "Item    ", value: "Cowboy hat")
                    ItemOnOrderPage(property: "Color    ", value: "Brown")
                    ItemOnOrderPage(property: "SKU     ", value: "234090985")
                }.padding(.horizontal, 18)
                
                //Create the ADDRESS item
                VStack (alignment: .leading) {
                    HStack {
                        Image(systemName: "house").font(.title).foregroundColor(Color.blue).padding(.trailing, 20)
                        Text("Address").font(.title)
                        Spacer()
                        Text("Update")
                            .font(.subheadline)
                            .foregroundColor(Color.white)
                            .padding(8)
                            .background(RoundedRectangle(cornerRadius: 5).fill(Color.blue.opacity(0.7)))
                    }
                    ItemOnOrderPage(property: "Address  ", value: "911 Broadway E")
                    ItemOnOrderPage(property: "City         ", value: "Seattle")
                    ItemOnOrderPage(property: "State       ", value: "WA")
                    ItemOnOrderPage(property: "ZIP          ", value: "98102")
                    
                }.padding(.horizontal, 18)
                
                //Create the PAYMENT item
                VStack (alignment: .leading) {
                    HStack {
                        Image(systemName: "creditcard").font(.title).foregroundColor(Color.orange).padding(.trailing, 20)
                        Text("Payment").font(.title)
                        Spacer()
                        Text("Refund")
                        .font(.subheadline)
                        .foregroundColor(Color.white)
                        .padding(8)
                        .background(RoundedRectangle(cornerRadius: 5).fill(Color.blue.opacity(0.7)))
                        Text("Discount")
                        .font(.subheadline)
                        .foregroundColor(Color.white)
                        .padding(8)
                        .background(RoundedRectangle(cornerRadius: 5).fill(Color.blue.opacity(0.7)))
                    }
                    ItemOnOrderPage(property: "Amount           ", value: "$49.99")
                    ItemOnOrderPage(property: "Last 4 digits    ", value: "0130")
                    ItemOnOrderPage(property: "Status              ", value: "ACCEPTED")
                }.padding(.horizontal, 18)
                
                //Create the STATUS item
                VStack (alignment: .leading) {
                    HStack {
                        Image(systemName: "gauge").font(.title).foregroundColor(Color.red).padding(.trailing, 20)
                        Text("Status").font(.title)
                        Spacer()
                        Text("Cancel")
                        .font(.subheadline)
                        .foregroundColor(Color.white)
                        .padding(8)
                        .background(RoundedRectangle(cornerRadius: 5).fill(Color.blue.opacity(0.7)))
                    }
                    ItemOnOrderPage(property: "State            ", value: "NOT SHIPPED")
                    ItemOnOrderPage(property: "Arrival          ", value: "10/01/20")
                    HStack {
                        ItemOnOrderPage(property: "Tracking Link", value: "URL")
                        Spacer()
                        HStack{
                            Text("Copy")
                            Image(systemName: "link")
                        }.foregroundColor(Color.blue)
                    }
                    
                }.padding(18)
                     
            }
        }
    }
}

struct OrderDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        OrderDetailsView(bindingExample: .constant("asldkfj"))
    }
}
