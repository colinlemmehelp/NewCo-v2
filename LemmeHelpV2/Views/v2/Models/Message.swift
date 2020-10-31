//
//  Message.swift
//  LemmeHelpV2
//
//  Created by Colin Power on 10/22/20.
//  Copyright © 2020 Colin Power. All rights reserved.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct Message: Identifiable, Codable {
    //means that whenever we map from a doc into a Message struct, it'll read the document and map it into this thing
    @DocumentID var id: String? = UUID().uuidString
    var message: String
    var message_mode: String
    var senderID: String
    var sentByCustomer: Bool
    var timestamp: Int

    //use CodingKeys to convert from names in Firebase to SwiftUI names
    enum CodingKeys: String, CodingKey {
        case message
        case message_mode
        case senderID
        case sentByCustomer
        case timestamp
    }
}
