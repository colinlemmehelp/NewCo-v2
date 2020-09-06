//
//  LoginView.swift
//  LemmeHelpV2
//
//  Created by Colin Power on 8/22/20.
//  Copyright © 2020 Colin Power. All rights reserved.
//

import SwiftUI
import Firebase

//https://www.youtube.com/watch?v=l1oTiPhq3VM
//video on firebase auth

//how to handle listening for auth state??
//https://benmcmahen.com/authentication-with-swiftui-and-firebase/
//https://www.youtube.com/watch?v=FhLEwqyVSjE

//switch this out when you're done building Login and Auth Views

struct LoginView: View {
    var body: some View {
        NavigationView {
            SignInView()
        }.navigationBarHidden(true)
    }
}

struct SignUpView: View {
    @State var email: String = ""
    @State var password: String = ""
    @State var error: String = ""
    @EnvironmentObject var session: SessionStore
    
    func signUp() {
        session.signUp(email: email, password: password) { (result, error) in
            if let error = error {
                self.error = error.localizedDescription
            } else {
                self.email = ""
                self.password = ""
            }
        }
    }
    
    var body: some View {
        VStack {
            Text("Create Account")
                .font(.system(size: 32, weight: .heavy))
            
            Text("Sign up to get started")
                .font(.system(size: 18, weight: .medium))
                .foregroundColor(Color.gray)
            
            VStack(spacing: 18) {
                TextField("Email address", text: $email)
                    .font(.system(size: 14))
                    .padding(12)
                    .background(RoundedRectangle(cornerRadius: 5).strokeBorder(Color.blue, lineWidth: 1))
                
                SecureField("Password", text: $password)
                    .font(.system(size: 14))
                    .padding(12)
                    .background(RoundedRectangle(cornerRadius: 5).strokeBorder(Color.blue, lineWidth: 1))
            }.padding(.vertical, 64)
            
            Button(action: signUp) {
                Text("Create Account")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .frame(height: 50)
                    .foregroundColor(.white)
                    .font(.system(size: 14, weight: .bold))
                    .background(LinearGradient(gradient: Gradient(colors: [Color.blue,Color.gray]), startPoint: .leading, endPoint: .trailing))
                .cornerRadius(5)
            }
            
            if (error != "") {
                Text(error)
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.red)
                    .padding()
            }
            Spacer()
        }.padding(.horizontal, 32)

    }

}



struct SignInView: View {
//    @State var email = "test@email.com"
//    @State var password = "testpw"
    
    @State var email = ""
    @State var password = ""
    @State var error = ""
    @EnvironmentObject var session: SessionStore
    @State var alertMessage = "Something went wrong."
    
    func login() {
        session.signIn(email: email, password: password) { (result, error) in
            if let error = error {
                self.error = error.localizedDescription
            } else {
                self.email = ""
                self.password = ""
            }
        }
    }
    
    
    //beautiful UI for login page
    //https://www.youtube.com/watch?v=RIsdXKlq3lY
    //https://www.youtube.com/watch?v=FhLEwqyVSjE
    
    var body: some View {
        VStack(alignment: .center) {
            VStack {
                Spacer()
                Text("Welcome back!").font(.largeTitle)
                Image(systemName: "person.circle").font(.largeTitle)
            }
            VStack(spacing: 18) {
                Spacer()
                TextField("Email address", text: $email)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 5).strokeBorder(Color.blue, lineWidth: 1))
                SecureField("Password", text: $password)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 5).strokeBorder(Color.blue, lineWidth: 1))
            }.padding(.horizontal, 32)
            VStack {
                Spacer()
                Button(action: self.login, label: {
                    Image(systemName: "hare.fill").font(.largeTitle)
                })
                Text("Login").font(.subheadline)
                Spacer()
            }.padding()
            
            if (error != "") {
                Text(error)
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.red)
                    .padding()

            }
            Spacer()
            
            NavigationLink(destination: SignUpView()) {
                HStack {
                    Text("New user?")
                        .font(.system(size: 14, weight: .light))
                        .foregroundColor(.primary)
                    
                    Text("Create an account")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(Color.blue)
                }
            }
            
        }
        
    }
}






struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
