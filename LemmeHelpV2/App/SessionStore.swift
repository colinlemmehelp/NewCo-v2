//
//  SessionStore.swift
//  LemmeHelpV2
//
//  Created by Colin Power on 8/22/20.
//  Copyright © 2020 Colin Power. All rights reserved.
//

import Foundation
import SwiftUI
import Firebase
import Combine

struct User {
    var uid: String
    var email: String
    
    init(uid: String, email: String?) {
        self.uid = uid
        self.email = email!
    }
}


class SessionStore : ObservableObject {
    //tabview hiding and showing
    @Published var tabBarIndex = 0
    
    //auth
    var didChange = PassthroughSubject<SessionStore, Never>()
    
    @Published var session: User? {didSet {self.didChange.send(self)}}
    
    var handle: AuthStateDidChangeListenerHandle?
    
    func listen () {
        // monitor authentication changes using firebase
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            if let user = user {
                // if we have a user, create a new user model
                //print("Got user: \(user)")
                self.session = User(uid: user.uid, email: user.email)
            } else {
                self.session = nil
            }
        }
    }

    func signUp(email: String, password: String, handler: @escaping AuthDataResultCallback) {
        Auth.auth().createUser(withEmail: email, password: password, completion: handler)
    }

    func signIn(email: String, password: String, handler: @escaping AuthDataResultCallback) {
        Auth.auth().signIn(withEmail: email, password: password, completion: handler)
    }

    func signOut() {
        do {
            try Auth.auth().signOut()
            self.session = nil
        } catch {
            print("Error signing out")
        }
    }

    func unbind() {
        if let handle = handle {
            Auth.auth().removeStateDidChangeListener(handle)
        }
    }
    
    deinit {
        unbind()
    }
}
    
    
//    var session: User? { didSet { self.didChange.send(self) }}
//    var handle: AuthStateDidChangeListenerHandle?
//
//    func listen () {
//        // monitor authentication changes using firebase
//        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
//            if let user = user {
//                // if we have a user, create a new user model
//                print("Got user: \(user)")
//                self.session = User(
//                    uid: user.uid,
//                    displayName: user.displayName
//                )
//            } else {
//                // if we don't have a user, set our session to nil
//                self.session = nil
//            }
//        }
//    }
//
//    // additional methods (sign up, sign in) will go here
//}
