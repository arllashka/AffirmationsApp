//
//  ResgisterPageView.swift
//  FinalProject
//
//  Created by Arlan on 3/13/21.
//

import SwiftUI

struct RegisterPageView: View {
    @ObservedObject var loginModel: LoginViewModel
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        ZStack(alignment: .topLeading){
        VStack{
            Spacer()
            Image("logo").resizable().frame(width: 200, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).padding(20)
            Text("La vie de rêve").font(.title).foregroundColor(.white)
            Text("Create an account:").font(.headline).padding(.bottom).foregroundColor(.white)
            VStack(spacing: 15){
                TextField("Email", text: $loginModel.email_register).padding(.horizontal, 20).padding(.vertical, 10).background(Color.white).cornerRadius(10).autocapitalization(.none).disableAutocorrection(true)
                SecureField("Password", text: $loginModel.password_register).padding(.horizontal, 20).padding(.vertical, 10).background(Color.white).cornerRadius(10)
                SecureField("Re-Password", text: $loginModel.repassword_register).padding(.horizontal, 20).padding(.vertical, 10).background(Color.white).cornerRadius(10)
            }.padding(.bottom).padding(.horizontal, 40)
            Button(action: {loginModel.register()}, label: {
                Text("Create Account").foregroundColor(.black).padding(.horizontal, 40).padding(.vertical, 8).background(Color.white).clipShape(Capsule())
            }).padding(.bottom)
            
            Spacer()
           
           
        }
            Button {
                self.presentationMode.wrappedValue.dismiss()
                loginModel.email_register = ""
                loginModel.password_register = ""
                loginModel.repassword_register = ""
            } label: {
                Image(systemName: "arrow.left").foregroundColor(.black).padding(10).background(Color.white).clipShape(Circle())
            }.padding(.top, (UIApplication.shared.windows.first?.safeAreaInsets.top)! + 10).padding(.leading)

        }.background(Color.black).edgesIgnoringSafeArea(.vertical)
        .alert(isPresented: $loginModel.alert) {
            Alert(title: Text("Error"), message: Text(loginModel.alertMsg), dismissButton: .default(Text("Ok")))
        }
        .navigationBarBackButtonHidden(true).navigationBarHidden(true)
    }
}

