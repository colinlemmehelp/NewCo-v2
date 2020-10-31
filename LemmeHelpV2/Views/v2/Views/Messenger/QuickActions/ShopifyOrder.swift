//
//  ShopifyOrder.swift
//  LemmeHelpV2
//
//  Created by Colin Power on 10/24/20.
//  Copyright © 2020 Colin Power. All rights reserved.
//

import SwiftUI

struct ShopifyOrder: View {
    //Observe the Tickets ViewModel to get the latest tix
    @ObservedObject var viewModel = TicketViewModel()
    
    var ticket: Ticket
    @Binding var showSheet:Bool
    
    @State var isLinkCopied = false
    var isOrderCancelled = false
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("Order")) {
                        //Order name
                        HStack {
                            Text("Number")
                            Spacer()
                            Text(ticket.order_number)
                        }
                        //Order price
                        HStack {
                            Text("ID")
                            Spacer()
                            Text(String(ticket.order_ID))
                        }
                        //Order Status
                        HStack {
                            Text("Status")
                            Spacer()
                            Text(ticket.order_status)
                        }
                    }
                    
                    Section(header: Text("Details")) {
                        //Order name
                        HStack {
                            Text("Name")
                            Spacer()
                            Text(ticket.order_name)
                        }
                        //Order price
                        HStack {
                            Text("Price")
                            Spacer()
                            Text("$" + String(ticket.order_price))
                        }
                        //Order URL
                        HStack {
                            Text("Tracking URL")
                            Spacer()
                            //Text("Copy Link").foregroundColor(Color.blue)
                            Button(action: {
                                self.isLinkCopied.toggle()
                                UIPasteboard.general.string = ticket.order_shippingURL
                            }) {
                                if(self.isLinkCopied == true){
                                    Text("Copied").foregroundColor(Color.gray)
                                } else {
                                    Text("Copy Link").foregroundColor(Color.blue)
                                }
                            }
                        }
                        //add a button to copy URL
                    }
                    
                    Section(header: Text("Actions")) {
                        Button(action: {
                            print("Perform an action here...")
                            viewModel.cancelOrder(ticket_reference: ticket.ticket_reference, order_ID: ticket.order_ID)
                        }) {
                            Text("Cancel Order").foregroundColor(Color.red)
                        }
                    }
                }
            }
            .navigationBarTitle("Shopify Order")
            .navigationBarItems(trailing: Button(action: {
                self.showSheet = false
            }) {
                Text("Done")
            })
        }
    }
}

//struct ShopifyOrder_Previews: PreviewProvider {
//    static var previews: some View {
//        ShopifyOrder()
//    }
//}
