//
//  TicketsViewModel.swift
//  LemmeHelpV2
//
//  Created by Colin Power on 8/22/20.
//  Copyright © 2020 Colin Power. All rights reserved.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
import Combine

//FOR HELP W FIRESTORE TIMESTAMPS:
//https://stackoverflow.com/questions/55869505/how-to-decode-a-timestamp-from-the-firebase-firestore-in-swift

//YOUTUBE VIDEO ON VIEWMODEL FOR FIRESTORE!!
//https://www.youtube.com/watch?v=f6u3AnOKZd0

//SERVERTIMESTAMP and CODABLE!!
//https://medium.com/firebase-developers/the-secrets-of-firestore-fieldvalue-servertimestamp-revealed-29dd7a38a82b
//https://www.youtube.com/watch?v=3-yQeAf3bLE

class TicketsViewModel: ObservableObject {

    @Published var newTickets = [Ticket]()
    @Published var myTickets = [Ticket]()
    @Published var keywordTickets = [Ticket]()
    @Published var autoTagTickets = [Ticket]()
    @Published var agentTagTickets = [Ticket]()
    @Published var ticketByID = Ticket(id: "", ticketID: "", name: "", question: "", timestamp: "", latestTimestamp: "", isUnread: false, latestMessage: "", autoTag: "", agentTag: "", isAutoTagCorrect: true, status: "", rating: 0)

    
    private var db = Firestore.firestore()
    
    ///MARK: need to come up with a way to update tickets, esp when one is resolved etc... can't use codable since it doesn't allow updates
    //turns out it's really easy.. just will be a little harder to set up
    //https://firebase.google.com/docs/firestore/manage-data/add-data
//    func updateTicket(ticket: Ticket) {
//        try db.collection("tickets").set
//    }
    
    //note.. won't need to add tickets but could be useful for chats, etc
//    func addTicket(ticket: Ticket) {
//        do {
//            let _ = try db.collection("tickets").addDocument(from: ticket)
//        }
//        catch {
//            print(error)
//        }
//    }
    
    func fetchTickets() {
        db.collection("tickets").whereField("agentID", isEqualTo: "").order(by: "timestamp", descending: true).getDocuments { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            self.newTickets = documents.map { (queryDocumentSnapshot) -> Ticket in
                let data = queryDocumentSnapshot.data()
                let name = data["name"] as? String ?? ""
                let question = data["question"] as? String ?? ""
                let autoTag = data["autoTag"] as? String ?? ""
                let agentTag = data["agentTag"] as? String ?? ""
                let isAutoTagCorrect = data["isAutoTagCorrect"] as? Bool ?? false
                
                let isUnread = data["isUnread"] as? Bool ?? false
                let latestMessage = data["latestMessage"] as? String ?? ""
                let timestamp: Timestamp = data["timestamp"] as! Timestamp
                //let latestTimestamp: Timestamp = data["latestTimestamp"] as! Timestamp
                //print(latestTimestamp)
                
                let date: Date = timestamp.dateValue()
                let formatter1 = DateFormatter()
                formatter1.dateFormat = "MMM d, h:mm a"
                let textOfTimestamp = formatter1.string(from: date)
                
                let status = data["status"] as? String ?? ""
                let rating = data["rating"] as? Int ?? 0
//                let latestDate: Date = latestTimestamp.dateValue()
//                let formatter2 = DateFormatter()
//                formatter2.dateFormat = "MMM d, h:mm a"
//                let textOfLatestTimestamp = formatter2.string(from: latestDate)
                
                let ticketID = queryDocumentSnapshot.reference.documentID
                
                
                return Ticket(ticketID: ticketID, name: name, question: question, timestamp: textOfTimestamp, latestTimestamp: "12:00pm", isUnread: isUnread, latestMessage: latestMessage, autoTag: autoTag, agentTag: agentTag, isAutoTagCorrect: isAutoTagCorrect, status: status, rating: rating)
            }
        }
    }
    
    func getTicketsForAgent(agentID: String) {
        db.collection("tickets").whereField("agentID", isEqualTo: agentID).order(by: "latestTimestamp", descending: true)
            .getDocuments { (querySnapshot, error) in
        
                guard let documents = querySnapshot?.documents else {
                    print("No documents")
                    return
                }
                self.myTickets = documents.map { (queryDocumentSnapshot) -> Ticket in
                    let data = queryDocumentSnapshot.data()
                    
                    let name = data["name"] as? String ?? ""
                    let question = data["question"] as? String ?? ""
                    let autoTag = data["autoTag"] as? String ?? ""
                    let agentTag = data["agentTag"] as? String ?? ""
                    let isAutoTagCorrect = data["isAutoTagCorrect"] as? Bool ?? false
                    
                    let isUnread = data["isUnread"] as? Bool ?? false
                    let latestMessage = data["latestMessage"] as? String ?? ""
                    
                    let timestamp: Timestamp = data["timestamp"] as! Timestamp
                    let latestTimestamp: Timestamp = data["latestTimestamp"] as! Timestamp
                    
                    let date: Date = timestamp.dateValue()
                    let formatter1 = DateFormatter()
                    formatter1.dateFormat = "MMM d, h:mm a"
                    let textOfTimestamp = formatter1.string(from: date)
                    
                    let latestDate: Date = latestTimestamp.dateValue()
                    let formatter2 = DateFormatter()
                    formatter2.dateFormat = "MMM d, h:mm a"
                    let textOfLatestTimestamp = formatter2.string(from: latestDate)
                    
                    let status = data["status"] as? String ?? ""
                    let rating = data["rating"] as? Int ?? 0
                    
                    let ticketID = queryDocumentSnapshot.reference.documentID
                    
                    print(textOfTimestamp)
                    print(textOfLatestTimestamp)
                    
                    return Ticket(ticketID: ticketID, name: name, question: question, timestamp: textOfTimestamp, latestTimestamp: textOfLatestTimestamp, isUnread: isUnread, latestMessage: latestMessage, autoTag: autoTag, agentTag: agentTag, isAutoTagCorrect: isAutoTagCorrect, status: status, rating: rating)
                }
        }
    }
    
    func getTicketByID (ticketID: String) {
        db.collection("tickets").document(ticketID)
            .addSnapshotListener { (documentSnapshot, error) in
        
                guard let document = documentSnapshot else {
                    print("Error fetching document: \(error!)")
                    return
                }
                guard let data = document.data() else {
                    print("Document was empty")
                    return
                }
                print("Current data: \(data)")
                
                let name = data["name"] as? String ?? ""
                let question = data["question"] as? String ?? ""
                let autoTag = data["autoTag"] as? String ?? ""
                let agentTag = data["agentTag"] as? String ?? ""
                let isAutoTagCorrect = data["isAutoTagCorrect"] as? Bool ?? false
                
                let isUnread = data["isUnread"] as? Bool ?? false
                let latestMessage = data["latestMessage"] as? String ?? ""
                
                let timestamp: Timestamp = data["timestamp"] as! Timestamp
                let latestTimestamp: Timestamp = data["latestTimestamp"] as! Timestamp
                
                let date: Date = timestamp.dateValue()
                let formatter1 = DateFormatter()
                formatter1.dateFormat = "MMM d, h:mm a"
                let textOfTimestamp = formatter1.string(from: date)
                
                let latestDate: Date = latestTimestamp.dateValue()
                let formatter2 = DateFormatter()
                formatter2.dateFormat = "MMM d, h:mm a"
                let textOfLatestTimestamp = formatter2.string(from: latestDate)
                
                let status = data["status"] as? String ?? ""
                let rating = data["rating"] as? Int ?? 0
                                
                self.ticketByID = Ticket(ticketID: "NULL", name: name, question: question, timestamp: textOfTimestamp, latestTimestamp: textOfLatestTimestamp, isUnread: isUnread, latestMessage: latestMessage, autoTag: autoTag, agentTag: agentTag, isAutoTagCorrect: isAutoTagCorrect, status: status, rating: rating)

        }
    }
    
    func getTicketsForKeyword (keyword: String) {
        db.collection("tickets").whereField("keywords", arrayContains: keyword)
            .addSnapshotListener { (querySnapshot, error) in
        
                guard let documents = querySnapshot?.documents else {
                    print("No documents")
                    return
                }
                self.keywordTickets = documents.map { (queryDocumentSnapshot) -> Ticket in
                    let data = queryDocumentSnapshot.data()
                    
                    let name = data["name"] as? String ?? ""
                    let question = data["question"] as? String ?? ""
                    let autoTag = data["autoTag"] as? String ?? ""
                    let agentTag = data["agentTag"] as? String ?? ""
                    let isAutoTagCorrect = data["isAutoTagCorrect"] as? Bool ?? false
                    
                    let isUnread = data["isUnread"] as? Bool ?? false
                    let latestMessage = data["latestMessage"] as? String ?? ""
                    
                    let timestamp: Timestamp = data["timestamp"] as! Timestamp
                    let latestTimestamp: Timestamp = data["latestTimestamp"] as! Timestamp
                    
                    let date: Date = timestamp.dateValue()
                    let formatter1 = DateFormatter()
                    formatter1.dateFormat = "MMM d, h:mm a"
                    let textOfTimestamp = formatter1.string(from: date)
                    
                    let latestDate: Date = latestTimestamp.dateValue()
                    let formatter2 = DateFormatter()
                    formatter2.dateFormat = "MMM d, h:mm a"
                    let textOfLatestTimestamp = formatter2.string(from: latestDate)
                    
                    let status = data["status"] as? String ?? ""
                    let rating = data["rating"] as? Int ?? 0
                    
                    let ticketID = queryDocumentSnapshot.reference.documentID
                    
                    print(date)
                    
                    return Ticket(ticketID: ticketID, name: name, question: question, timestamp: textOfTimestamp, latestTimestamp: textOfLatestTimestamp, isUnread: isUnread, latestMessage: latestMessage, autoTag: autoTag, agentTag: agentTag, isAutoTagCorrect: isAutoTagCorrect, status: status, rating: rating)
                }
        }
    }
    
    func getTicketsForAutoTag (autoTag: String) {
        db.collection("tickets").whereField("autoTag", isEqualTo: autoTag)
            .addSnapshotListener { (querySnapshot, error) in
        
                guard let documents = querySnapshot?.documents else {
                    print("No documents")
                    return
                }
                self.autoTagTickets = documents.map { (queryDocumentSnapshot) -> Ticket in
                    let data = queryDocumentSnapshot.data()
                    
                    let name = data["name"] as? String ?? ""
                    let question = data["question"] as? String ?? ""
                    let autoTag = data["autoTag"] as? String ?? ""
                    let agentTag = data["agentTag"] as? String ?? ""
                    let isAutoTagCorrect = data["isAutoTagCorrect"] as? Bool ?? false
                    
                    let isUnread = data["isUnread"] as? Bool ?? false
                    let latestMessage = data["latestMessage"] as? String ?? ""
                    
                    let timestamp: Timestamp = data["timestamp"] as! Timestamp
                    let latestTimestamp: Timestamp = data["latestTimestamp"] as! Timestamp
                    
                    let date: Date = timestamp.dateValue()
                    let formatter1 = DateFormatter()
                    formatter1.dateFormat = "MMM d, h:mm a"
                    let textOfTimestamp = formatter1.string(from: date)
                    
                    let latestDate: Date = latestTimestamp.dateValue()
                    let formatter2 = DateFormatter()
                    formatter2.dateFormat = "MMM d, h:mm a"
                    let textOfLatestTimestamp = formatter2.string(from: latestDate)
                    
                    let status = data["status"] as? String ?? ""
                    let rating = data["rating"] as? Int ?? 0
                    
                    let ticketID = queryDocumentSnapshot.reference.documentID
                    
                    
                    return Ticket(ticketID: ticketID, name: name, question: question, timestamp: textOfTimestamp, latestTimestamp: textOfLatestTimestamp, isUnread: isUnread, latestMessage: latestMessage, autoTag: autoTag, agentTag: agentTag, isAutoTagCorrect: isAutoTagCorrect, status: status, rating: rating)
                }
        }
    }
    
    func getTicketsForAgentTag (agentTag: String) {
           db.collection("tickets").whereField("agentTag", isEqualTo: agentTag)
               .addSnapshotListener { (querySnapshot, error) in
           
                   guard let documents = querySnapshot?.documents else {
                       print("No documents")
                       return
                   }
                   self.agentTagTickets = documents.map { (queryDocumentSnapshot) -> Ticket in
                       let data = queryDocumentSnapshot.data()
                       
                       let name = data["name"] as? String ?? ""
                       let question = data["question"] as? String ?? ""
                       let autoTag = data["autoTag"] as? String ?? ""
                       let agentTag = data["agentTag"] as? String ?? ""
                       let isAutoTagCorrect = data["isAutoTagCorrect"] as? Bool ?? false
                       
                       let isUnread = data["isUnread"] as? Bool ?? false
                       let latestMessage = data["latestMessage"] as? String ?? ""
                       
                       let timestamp: Timestamp = data["timestamp"] as! Timestamp
                       let latestTimestamp: Timestamp = data["latestTimestamp"] as! Timestamp
                       
                       let date: Date = timestamp.dateValue()
                       let formatter1 = DateFormatter()
                       formatter1.dateFormat = "MMM d, h:mm a"
                       let textOfTimestamp = formatter1.string(from: date)
                       
                       let latestDate: Date = latestTimestamp.dateValue()
                       let formatter2 = DateFormatter()
                       formatter2.dateFormat = "MMM d, h:mm a"
                       let textOfLatestTimestamp = formatter2.string(from: latestDate)
                    
                        let status = data["status"] as? String ?? ""
                        let rating = data["rating"] as? Int ?? 0
                       
                       let ticketID = queryDocumentSnapshot.reference.documentID
                       
                       
                    return Ticket(ticketID: ticketID, name: name, question: question, timestamp: textOfTimestamp, latestTimestamp: textOfLatestTimestamp, isUnread: isUnread, latestMessage: latestMessage, autoTag: autoTag, agentTag: agentTag, isAutoTagCorrect: isAutoTagCorrect, status: status, rating: rating)
                   }
           }
       }
    
    
    func resolveTicket(ticketID: String, rating: Int) {
        db.collection("tickets").document(ticketID).updateData([
            "rating": rating,
            "status": "CLOSED",
            "resolutionTimestamp": Date()
        ]) { err in
            if let err = err {
                print("Error updating document: \(err)")
            } else {
                //print("Document successfully updated")
            }
        }
    }
    
    func updateTicketWithLatestResponse(ticketID: String, latestMessage: String, agentID: String) {
        db.collection("tickets").document(ticketID).updateData([
            "isUnread": false,
            "latestMessage": latestMessage,
            "latestTimestamp": Date(),
            "agentID": agentID
        ]) { err in
            if let err = err {
                print("Error updating document: \(err)")
            } else {
                //print("Document successfully updated")
            }
        }
    }
    
    func respondToAutoTag(ticketID: String, isAutoTagCorrect: Bool, agentTag: String) {
        db.collection("tickets").document(ticketID).updateData([
            "isAutoTagCorrect": isAutoTagCorrect,
            "agentTag": agentTag
        ]) { err in
            if let err = err {
                print("Error updating document: \(err)")
            } else {
                //print("Document successfully updated")
            }
        }
    }
    
    func updateAgentTag(ticketID: String, agentTag: String) {
        db.collection("tickets").document(ticketID).updateData([
            "agentTag": agentTag
        ]) { err in
            if let err = err {
                print("Error updating document: \(err)")
            } else {
                //print("Document successfully updated")
            }
        }
    }
    
    
}

