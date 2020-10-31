//
//  TicketViewModel.swift
//  LemmeHelp
//
//  Created by Colin Power on 10/22/20.
//  Copyright © 2020 Colin Power. All rights reserved.
//

//https://www.youtube.com/watch?v=3-yQeAf3bLE
//https://www.youtube.com/watch?v=imTjGvSjBEw
//https://github.com/alickbass/CodableFirebase
//https://peterfriese.dev/swiftui-firebase-codable
//https://medium.com/firebase-developers/swiftui-mapping-firestore-documents-using-swift-codable-589b6bfe462d


import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
import Combine


class TicketViewModel: ObservableObject, Identifiable {
    //What arrays or data do we want to be accessible from here? Should be everything we need as it relates to Tickets
    
    @Published var tickets = [Ticket]()
    //@Published var openTicketsArray = [Ticket]()
    //Note: when there are multiple companies on this app, will need to segment tickets by who is eligible to receive each.. i.e. some user preferences
    @Published var myTicketsArray_OPEN = [Ticket]()
    @Published var myTicketsArray_CLOSED = [Ticket]()
    
    private var db = Firestore.firestore()
    
    //Get all tickets that I am able to answer
    func getAllTickets() {
        print("this function was called")
        var listener1 = db.collection("tickets")
            .whereField("state_agentID", isEqualTo: "")
            .addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
//            print(documents)
//            print(documents.count)
//            print("docs count")
            self.tickets = documents.compactMap { (queryDocumentSnapshot) -> Ticket? in
                //print(try? queryDocumentSnapshot.data(as: Ticket.self))
                return try? queryDocumentSnapshot.data(as: Ticket.self)
                //return try? queryDocumentSnapshot.data(as: Ticket.self)
            }
        }
    }
    
//    func detachAllTicketsListener() {
//        let listener = db.collection("tickets").addSnapshotListener { querySnapshot, error in
//            //can leave this blank??
//        }
//        listener.remove()
//    }
    
    //Get my tickets that are currently OPEN
    func getMyTickets_OPEN(agentID: String) {
        db.collection("tickets")
            .whereField("state_agentID", isEqualTo: agentID)
            .whereField("state_status", isEqualTo: "OPEN")
            .order(by: "lastMessage_timestamp", descending: true)
            .addSnapshotListener { (querySnapshot, error) in
                guard let documents = querySnapshot?.documents else {
                    print("No documents")
                    return
                }
            print(documents.count)
            for doc in documents {
                print(doc.data())
            }
//            print("docs count")
                self.myTicketsArray_OPEN = documents.compactMap { (queryDocumentSnapshot) -> Ticket? in
                    //print(try? queryDocumentSnapshot.data(as: Ticket.self))
                    return try? queryDocumentSnapshot.data(as: Ticket.self)
                    //return try? queryDocumentSnapshot.data(as: Ticket.self)
                }
            }
    }
    
    
    //Get my tickets that are currently CLOSED
    func getMyTickets_CLOSED(agentID: String) {
        db.collection("tickets")
            .whereField("state_AgentID", isEqualTo: agentID)
            .whereField("state_status", isEqualTo: "CLOSED")
            .order(by: "lastMessage_timestamp", descending: true)
            .addSnapshotListener { (querySnapshot, error) in
                guard let documents = querySnapshot?.documents else {
                    print("No documents")
                    return
                }
//            print(documents.count)
//            print("docs count")
                self.myTicketsArray_CLOSED = documents.compactMap { (queryDocumentSnapshot) -> Ticket? in
                    //print(try? queryDocumentSnapshot.data(as: Ticket.self))
                    return try? queryDocumentSnapshot.data(as: Ticket.self)
                    //return try? queryDocumentSnapshot.data(as: Ticket.self)
                }
            }
    }
    
    
    func resolveTicket(ticket_reference: String, state_rating: Int) {
        db.collection("tickets").document(ticket_reference).updateData([
            "state_rating": state_rating,
            "state_status": "CLOSED",
            "state_resolutionTimestamp": Date().timeIntervalSince1970
        ]) { err in
            if let err = err {
                print("Error updating document: \(err)")
            } else {
                //print("Document successfully updated")
            }
        }
    }
    
    //note: need the cancellation request to post back to the ticketID and update it as CANCELLED!
    func cancelOrder(ticket_reference: String, order_ID: Int) {
        db.collection("tickets").document(ticket_reference).collection("cancelOrder").addDocument(data: [
            "orderID": order_ID,
        ]) { err in
            if let err = err {
                print("Error updating document: \(err)")
            } else {
                //print("Document successfully updated")
            }
        }
    }
    
    
    //Functions related to tagging
    func tag_confirmAutoTag(ticket_reference: String, ticket_tag: String) {
        db.collection("tickets").document(ticket_reference).updateData([
            "tag_isDismissed": true,
            "tag_selected": ticket_tag
        ]) { err in
            if let err = err {
                print("Error updating document: \(err)")
            } else {
                //print("Document successfully updated")
            }
        }
    }
    
    func tag_dismissAutoTag(ticket_reference: String) {
        db.collection("tickets").document(ticket_reference).updateData([
            "tag_isDismissed": true
        ]) { err in
            if let err = err {
                print("Error updating document: \(err)")
            } else {
                //print("Document successfully updated")
            }
        }
    }


    //
    //    func respondToAutoTag(ticketID: String, isAutoTagCorrect: Bool, agentTag: String) {
    //        db.collection("tickets").document(ticketID).updateData([
    //            "isAutoTagCorrect": isAutoTagCorrect,
    //            "agentTag": agentTag
    //        ]) { err in
    //            if let err = err {
    //                print("Error updating document: \(err)")
    //            } else {
    //                //print("Document successfully updated")
    //            }
    //        }
    //    }
    //
    //    func updateAgentTag(ticketID: String, agentTag: String) {
    //        db.collection("tickets").document(ticketID).updateData([
    //            "agentTag": agentTag
    //        ]) { err in
    //            if let err = err {
    //                print("Error updating document: \(err)")
    //            } else {
    //                //print("Document successfully updated")
    //            }
    //        }
    //    }

    
    
}

//.whereField("state_agentID", isEqualTo: "").order(by: "ticket_timestamp", descending: true)
