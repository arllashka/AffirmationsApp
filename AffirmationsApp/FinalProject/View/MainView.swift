//
//  MainView.swift
//  FinalProject
//
//  Created by Arlan on 3/13/21.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var model: LoginViewModel
    var body: some View {
        ZStack{
            if model.index == 0{
                VStack{
                    HStack{
                        Spacer()
                        Button(action:{
                            model.logout()
                        model.email = ""
                        model.password = ""
                        }, label:{
                            Text("log out").foregroundColor(.white).padding(10).background(Color.black).cornerRadius(8)
                        })
                    }.padding(.top, (UIApplication.shared.windows.first?.safeAreaInsets.top)!+24).padding(.trailing, 20).padding(.bottom, 4)
                    HStack{
                        Text("Today's Tasks").font(.title).fontWeight(.bold).foregroundColor(.white).padding(.bottom, 100).padding(.leading, 30)
                        Spacer()
                    }.padding(.bottom, 20)
                    
                    UserLoggedView(model: self.model)
                    Spacer()
                    
                }
            
                
            } else if model.index == 1{
                VStack{
                    HStack{
                        Spacer()
                        Button(action:{
                            model.logout()
                        model.email = ""
                        model.password = ""
                        }, label:{
                            Text("log out").foregroundColor(.white).padding(10).background(Color.black).cornerRadius(8)
                        })
                    }.padding(.top, (UIApplication.shared.windows.first?.safeAreaInsets.top)!+24).padding(.trailing, 20).padding(.bottom, 4)
                    HStack{
                        Text("\(model.email_stored)").font(.title).fontWeight(.bold).foregroundColor(.white).padding(.bottom, 100).padding(.leading, 30)
                        Spacer()
                    }.padding(.bottom, 20)
                    
                    MenuView(model: self.model)
                    Spacer()
                    
                }
            }
         
            VStack{
                Spacer()
            Divider()
                HStack(spacing: 60){
                    Button(action: {model.index = 0}, label: {
                        VStack{
                            Image(systemName: "square.and.pencil").font(model.index == 0 ? .system(size: 24) : .system(size: 19))
                            Text("Create").font(model.index == 0 ? .body : .caption)
                        }
                    }).frame(width: 100)
                    
                    Rectangle().frame(width: 1, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    Button(action: {model.index = 1}, label: {
                        VStack{
                            Image(systemName: "person.circle.fill").font(model.index == 1 ? .system(size: 24) : .system(size: 19))
                            Text("Profile").font(model.index == 1 ? .body : .caption)
                        }
                    }).frame(width: 100)
                    
                }
            }.padding(.bottom, 50)
            
        }
        
        .foregroundColor(.white)
        .navigationBarHidden(true)
        .navigationBarTitle("Today Tasks")
        .navigationBarBackButtonHidden(true)
        .background(
            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)), Color(#colorLiteral(red: 0.2282379637, green: 0.0606476727, blue: 0.4235294163, alpha: 1))]), startPoint: .top, endPoint: .bottom)
        )
        .edgesIgnoringSafeArea(.vertical)
        .onAppear{
            model.getData()
        }
    }
}

