//
//  MessageBubble.swift
//  LemmeHelpV2
//
//  Created by Colin Power on 10/22/20.
//  Copyright © 2020 Colin Power. All rights reserved.
//

import SwiftUI
import FirebaseFirestore
import Combine

struct MessageBubble: View {
    var message: Message
        
    var body: some View {
        Group {
            if (message.sentByCustomer) {
                HStack {
                    VStack(alignment: .leading) {
                        HStack {
                            Text(message.message)
                                .font(.body)
                                .foregroundColor(Color.black.opacity(0.7))
                        }
                        .padding(8)
                        //.background(RoundedRectangle(cornerRadius: 5).fill(Color.gray.opacity(0.3)))
                        .background(RoundedRectangle(cornerRadius: 5).strokeBorder(Color.gray, lineWidth: 0.5))
                        HStack{
                            Text(convertTimestampToDateString(timestamp: message.timestamp))
                                .font(.footnote)
                                .foregroundColor(Color.gray)
                            Spacer()
                        }
                    }
                    .padding(.leading, 16)
                    .padding(.vertical, 8)
                    Spacer(minLength: 40)
                }
            } else {
                HStack {
                    Spacer(minLength: 40)
                    VStack(alignment: .trailing) {
                        HStack {
                            Text(message.message)
                                .font(.body)
                                .foregroundColor(Color.black.opacity(0.7))
                        }
                        .padding(8)
                        .background(RoundedRectangle(cornerRadius: 5).fill(Color.blue.opacity(0.2)))
                        HStack{
                            Spacer()
                            Text(convertTimestampToDateString(timestamp: message.timestamp))
                                .font(.footnote)
                                .foregroundColor(Color.gray)
                        }
                    }
                    .padding(.trailing, 16)
                    .padding(.vertical, 8)
                }
            }
        }
    }
    
    //dateformatting help!!
    //https://stackoverflow.com/questions/35700281/date-format-in-swift
    
    private func convertTimestampToDateString(timestamp: Int) -> String {
        let dateNow = Date()
        let unixNow = dateNow.timeIntervalSince1970
        
        //check how long it's been
        if (Int(unixNow) - timestamp < 86400) {
            //if it's been < 1 day, write "Today at 3:43 PM"
            let date1 = Date(timeIntervalSince1970: Double(timestamp))
            let formatter = DateFormatter()
            formatter.dateFormat = "h:mm a"
            
            let timeString = formatter.string(from: date1)
            
            return "Today at " + timeString
        } else {
            //else, write "Oct 12, 3:43 PM"
            let date1 = Date(timeIntervalSince1970: Double(timestamp))
            let formatter = DateFormatter()
            formatter.dateFormat = "MMM d, h:mm a"
            
            return formatter.string(from: date1)
        }
    }
    
    
}




//struct Messages_Previews: PreviewProvider {
//    static var previews: some View {
//        Messages()
//    }
//}
