//
//  ChatRow.swift
//  LemmeHelpV2
//
//  Created by Colin Power on 8/22/20.
//  Copyright © 2020 Colin Power. All rights reserved.
//

import SwiftUI

struct ChatRow: View {

    
    var name: String
    var chat: String
    var timestamp: String
    //var isFromAgent: Bool
    
    var body: some View {
        Group {
            if (name == "customer") {
                HStack {
                    VStack(alignment: .leading) {
                        HStack {
                            Text(chat)
                                .font(.body)
                                .foregroundColor(Color.white)
                        }
                        .padding(8)
                        .background(RoundedRectangle(cornerRadius: 5).fill(Color.gray.opacity(0.7)))
                        HStack{
                            Text(timestamp)
                                .font(.subheadline)
                                .foregroundColor(Color.gray)
                            Spacer()
                        }.padding(.top, 4)
                    }.padding(8)
                    Spacer(minLength: 60)
                }
            } else {
                HStack {
                    Spacer(minLength: 60)
                    VStack(alignment: .trailing) {
                        HStack {
                            Text(chat)
                                .font(.body)
                                .foregroundColor(Color.white)
                        }
                        .padding(8)
                        .background(RoundedRectangle(cornerRadius: 5).fill(Color.blue.opacity(0.7)))
                        HStack{
                            Spacer()
                            Text(timestamp)
                                .font(.subheadline)
                                .foregroundColor(Color.gray)
                        }.padding(.top, 4)
                    }.padding(8)
                }
            }
        }
    }
}


struct ChatRow_Previews: PreviewProvider {
    static var previews: some View {
        ChatRow(name: "customer", chat: "example of a chat question from a user", timestamp: "6:01 AM")
    }
}
