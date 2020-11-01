//
//  AppDelegate.swift
//  LemmeHelpV2
//
//  Created by Colin Power on 8/5/20.
//  Copyright © 2020 Colin Power. All rights reserved.
//

import UIKit
import Firebase
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // Use Firebase library to configure APIs
        FirebaseApp.configure()
        
        // Set up connection to Stripe
//        Stripe.setDefaultPublishableKey("pk_test_51HibuWKDPlyoN2kZ027Xz4u8BNh9cnJEd6bdhofCYOFmyki3t9DXu4BvGRSjnTNKbDqBsxT9QQgE94nvMuR46UtA0087j7WDDX")
        
        //application.registerForRemoteNotifications()
        //Messaging.messaging().delegate = self
        
        return true
    }
    

    

    
    
    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

}

