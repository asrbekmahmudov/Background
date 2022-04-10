//
//  SignInScreen.swift
//  KnowledgeBackground
//
//  Created by Mahmudov Asrbek Ulug'bek o'g'li on 18/09/21.
//

import SwiftUI

struct SignInScreen: View {
    
    @EnvironmentObject var session: SessionStore
    @State var isLoading = false
    @State var email = "asrbekmahmudov@gmail.com"
    @State var password = "12345678"
    
    func doSignIn() {
        isLoading = true
        SessionStore().signIn(email: email, password: password, handler: { (res, err) in
            isLoading = false
            if err != nil {
                print("Check email or password")
                return
            }
            session.listen()
            print("User signed in")
        })
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack(spacing: 10) {
                    Spacer()
                    Text("Welcome Back")
                        .font(.title)
                        .padding(.bottom, 10)
                    TextField("Email", text: $email)
                        .frame(height: 45)
                        .padding(.leading, 10)
                        .background(Color.gray.opacity(0.2).cornerRadius(8))
                    SecureField("Password", text: $password)
                        .frame(height: 45)
                        .padding(.leading, 10)
                        .background(Color.gray.opacity(0.2).cornerRadius(8))
                    Button(action: {
                        doSignIn()
                    }, label: {
                        HStack {
                            Spacer()
                            Text("Sign In")
                                .foregroundColor(.white)
                            Spacer()
                        }
                    })
                    .frame(height: 45)
                    .background(Color.blue)
                    .cornerRadius(8)
                    Spacer()
                    HStack {
                        Text("Don't have an account?")
                            .foregroundColor(.primary)
                        NavigationLink(destination:
                            SignUpScreen()
                        , label: {
                            Text("Sign Up")
                                .foregroundColor(.primary)
                                .bold()
                        })
                    }
            
                }.padding()
                
                if isLoading {
                    ProgressView()
                }
            }
        }
    }
}

struct SignInScreen_Previews: PreviewProvider {
    static var previews: some View {
        SignInScreen()
    }
}
