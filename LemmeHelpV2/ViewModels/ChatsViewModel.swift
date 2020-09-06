//
//  ChatsViewModel.swift
//  LemmeHelpV2
//
//  Created by Colin Power on 8/22/20.
//  Copyright © 2020 Colin Power. All rights reserved.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
import Combine

class ChatsViewModel: ObservableObject {
    @Published var chats = [Chat]()
    
    private var db = Firestore.firestore()
    private var ticketID : String = ""
    
    ///MARK: need to come up with a way to update
    
    
    func addChat(ticketID: String, chat: String, agentID: String) {
        do {
            let _ = try db.collection("tickets").document(ticketID).collection("messages").addDocument(data: [
                    "message": chat,
                    "senderID": agentID,
                    "sentByCustomer": false,
                    "timestamp": Timestamp(date: Date())
                ])
        }
        catch {
            print(error)
        }
    }
    
    func fetchChat(ticketID: String) {
        if ticketID.isEmpty {
            print("ticketID was empty")
            return
        } else {
            db.collection("tickets").document(ticketID).collection("messages").order(by: "timestamp", descending: false).addSnapshotListener { (querySnapshot, error) in
                guard let documents = querySnapshot?.documents else {
                    print("No documents")
                    return
                }
                self.chats = documents.map { (queryDocumentSnapshot) -> Chat in
                    let data = queryDocumentSnapshot.data()
                    
                    let name = data["senderID"] as? String ?? ""
                    let chat = data["message"] as? String ?? ""
                    let timestamp: Timestamp = data["timestamp"] as! Timestamp
                    let date: Date = timestamp.dateValue()
                    let formatter1 = DateFormatter()
                    formatter1.dateFormat = "MMM d, h:mm a"
                    let textOfTimestamp = formatter1.string(from: date)
                    
                    return Chat(name: name, chat: chat, timestamp: textOfTimestamp)
                }
            }
        }
    }
}

