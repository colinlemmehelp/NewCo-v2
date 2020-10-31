//
//  Ticket.swift
//  LemmeHelpV2
//
//  Created by Colin Power on 10/22/20.
//  Copyright © 2020 Colin Power. All rights reserved.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct Ticket: Identifiable, Codable {
    //means that whenever we map from a doc into a Ticket struct, it'll read the document and map it into this thing
    @DocumentID var id: String? = UUID().uuidString
    var company_id: String
    var company_image: String
    var company_name: String
    var customer_email: String
    var customer_first: String
    var customer_last: String
    var customer_phone: String
    var lastMessage_isUnread: Bool
    var lastMessage_text: String
    var lastMessage_timestamp: Int
    var order_ID: Int
    var order_name: String
    var order_number: String
    var order_price: Int
    var order_shippingURL: String
    var order_status: String
    var state_agentID: String
    var state_rating: Int
    var state_resolutionTimestamp: Int
    var state_status: String
    var suggestedReply_agentActualResponse: String
    var suggestedReply_automatic: String
    var suggestedReply_isDismissed: Bool
    var tag_automatic: String
    var tag_isDismissed: Bool
    var tag_selected: String
    var ticket_firstResponseTimestamp: Int
    var ticket_mode: String
    var ticket_text: String
    var ticket_timestamp: Int
    var ticket_reference: String

    //use CodingKeys to convert from names in Firebase to SwiftUI names
    enum CodingKeys: String, CodingKey {
        case company_id
        case company_image
        case company_name
        case customer_email
        case customer_first
        case customer_last
        case customer_phone
        case lastMessage_isUnread
        case lastMessage_text
        case lastMessage_timestamp
        case order_ID
        case order_name
        case order_number
        case order_price
        case order_shippingURL
        case order_status
        case state_agentID
        case state_rating
        case state_resolutionTimestamp
        case state_status
        case suggestedReply_agentActualResponse //= "firstResponse"
        case suggestedReply_automatic
        case suggestedReply_isDismissed
        case tag_automatic
        case tag_isDismissed
        case tag_selected
        case ticket_firstResponseTimestamp
        case ticket_mode
        case ticket_text
        case ticket_timestamp
        case ticket_reference
    }
}
