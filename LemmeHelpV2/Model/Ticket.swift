//
//  Tickets.swift
//  LemmeHelpV2
//
//  Created by Colin Power on 8/21/20.
//  Copyright © 2020 Colin Power. All rights reserved.
//

import Foundation
import SwiftUI
import Combine
import FirebaseFirestore
import FirebaseFirestoreSwift

struct Ticket: Identifiable {
    var id = UUID().uuidString
    
    //note: these attribute names don't need to match Firestore.. if you use the CodingKeys enum
    //can also map the DocumentID to the struct here.. this lets firestore know that it should map the DocumentID to the id
    var ticketID: String;
    var name: String;
    var question: String;
    var timestamp: String
    var latestTimestamp: String
    var isUnread: Bool
    var latestMessage: String
    var autoTag: String
    var agentTag: String
    var isAutoTagCorrect: Bool
    
//    enum CodingKeys: String, CodingKey {
//        case name
//        case question
//        case timestamp
//        //case timestamp = "date"
//        //note: we don't need to do this now, but can use later if we want to mess with naming conventions
//    }
}



#if DEBUG
let ticketNow = Date()

let testData = [
    Ticket(id: "fakeUUID", ticketID: "fakeIdhere", name: "Colin", question: "I hate returning to your site, I'm going to cancel!", timestamp: "12:15am", latestTimestamp: "12:00pm", isUnread: true, latestMessage: "", autoTag: "return", agentTag: "cancel", isAutoTagCorrect: false)
]
#endif

struct Tickets_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
