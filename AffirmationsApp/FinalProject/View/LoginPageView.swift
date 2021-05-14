//
//  LoginPageView.swift
//  FinalProject
//
//  Created by Arlan on 3/13/21.
//

import SwiftUI

struct LoginPageView: View {
    @ObservedObject var loginModel : LoginViewModel
    var body: some View {
        VStack{
            
            Spacer()
            Text("Created by Arlan Kalin").foregroundColor(.white)
            Image("logo").resizable().frame(width: 200, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).padding(20)
            Text("La vie de rêve").font(.title).foregroundColor(.white)
            Text("Create an account:").font(.headline).padding(.bottom).foregroundColor(.white)
            VStack(spacing: 15){
                TextField("Log-In", text: $loginModel.email).padding(.horizontal, 20).padding(.vertical, 10).background(Color.white).cornerRadius(10).disableAutocorrection(true).autocapitalization(.none)
                SecureField("Password", text: $loginModel.password).padding(.horizontal, 20).padding(.vertical, 10).background(Color.white).cornerRadius(10)
            }.padding(.bottom).padding(.horizontal, 40)
            Button(action: {loginModel.login()}, label: {
                Text("Login").foregroundColor(.black).padding(.horizontal, 40).padding(.vertical, 8).background(Color.white).clipShape(Capsule())
            }).padding(.bottom)
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("Forgot password").foregroundColor(.blue).font(.system(size: 14))
            })
            Spacer()
            
            HStack{
                Text("Don't have an account?").foregroundColor(.white)
                NavigationLink(destination: RegisterPageView(loginModel: self.loginModel), isActive: $loginModel.registered, label: {
                    Text("Sign Up!")
                })
            }.padding(.bottom, 70)
        }.background(Color.black).edgesIgnoringSafeArea(.vertical)
        .alert(isPresented: $loginModel.alert, content: {
            Alert(title: Text("Error"), message: Text(loginModel.alertMsg), dismissButton: .default(Text("Ok")))
        })
    }
}


