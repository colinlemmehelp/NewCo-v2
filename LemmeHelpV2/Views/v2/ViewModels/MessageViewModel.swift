//
//  MessageViewModel.swift
//  LemmeHelpV2
//
//  Created by Colin Power on 10/22/20.
//  Copyright © 2020 Colin Power. All rights reserved.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
import Combine

class MessageViewModel: ObservableObject, Identifiable {
    //What arrays or data do we want to be accessible from here? Should be everything we need as it relates to Messages
    
    @Published var messages = [Message]()
    
    private var db = Firestore.firestore()
    
    //Get all messages for a certain ticket
    func getAllMessagesForTicket(ticket_reference: String) {
        db.collection("tickets")
            .document(ticket_reference)
            .collection("messages")
            .order(by: "timestamp", descending: false)
            .addSnapshotListener { (querySnapshot, error) in
                guard let documents = querySnapshot?.documents else {
                    print("No documents")
                    return
                }
                print(documents)
                print(documents.count)
                print("messages count")
                self.messages = documents.compactMap { (queryDocumentSnapshot) -> Message? in
                    //print(try? queryDocumentSnapshot.data(as: Ticket.self))
                    return try? queryDocumentSnapshot.data(as: Message.self)
                    //return try? queryDocumentSnapshot.data(as: Ticket.self)
                }
        }
    }
    
    func addResponse(ticket_reference: String, message: String, state_agentID: String, ticket_mode: String) {
        do {
            let _ = try db.collection("tickets").document(ticket_reference).collection("messages").addDocument(data: [
                    "message": message,
                    "message_mode": ticket_mode,
                    "senderID": state_agentID,
                    "sentByCustomer": false,
                    "timestamp": round(Date().timeIntervalSince1970)
                ])
        }
        catch {
            print(error)
        }
    }
    
    
    
}



