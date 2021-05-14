//
//  ContentView.swift
//  FinalProject
//
//  Created by Arlan on 3/13/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var loginModel : LoginViewModel = LoginViewModel()
    @State var status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
    var body: some View {
        NavigationView{
            if self.status{
            MainView(model: self.loginModel)
               
        } else {
            
            LoginPageView(loginModel: self.loginModel)
            
        }
        }.onAppear(perform: {
            NotificationCenter.default.addObserver(forName: NSNotification.Name("status"), object: nil, queue: .main) { (_) in
                self.status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
            }
        })
    }
}


