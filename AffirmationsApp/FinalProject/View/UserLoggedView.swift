//
//  UserLoggedView.swift
//  FinalProject
//
//  Created by Arlan on 3/13/21.
//

import SwiftUI



struct UserLoggedView: View {
    @ObservedObject var model : LoginViewModel
    let width: CGFloat = 150
    init(model: LoginViewModel) {
        self.model = model
            //Use this if NavigationBarTitle is with Large Font
            UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]

            //Use this if NavigationBarTitle is with displayMode = .inline
            UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
        
        }
    var body: some View {
        
        VStack{

            VStack{
                HStack{
                    
                    VStack{
                        NavigationLink(
                            destination: NewAffirmationView(model: self.model),
                            label: {
                                ZStack{
                                Image("image1").resizable().frame(width: width, height: width, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).cornerRadius(8).shadow(radius: 6).opacity(model.affirmationCompleted ? 0.5 : 1.0)
                                    if model.affirmationCompleted {
                                        Image(systemName: "checkmark.circle").font(.system(size: 30))
                                    }
                                }
                            }).disabled(model.affirmationCompleted)
                        
                        Text("Affirmations")
                    }
                    Spacer()
                    VStack{
                        NavigationLink(
                            destination: NewMoodView(model: self.model),
                            label: {
                                ZStack{
                                Image("image2").resizable().frame(width: width, height: width, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).cornerRadius(8).shadow(radius: 6)
                                    .opacity(model.moodsCompleted ? 0.5 : 1.0)
                                        if model.moodsCompleted {
                                            Image(systemName: "checkmark.circle").font(.system(size: 30))
                                        }
                                }
                            }).disabled(model.moodsCompleted)
                        
                        Text("Tell about mood")
                    }
                }.padding(.horizontal, 34)
                HStack{
                    
                    VStack{
                        NavigationLink(
                            destination: NewPlanView(model: self.model),
                            label: {
                                ZStack{
                                Image("image3").resizable().frame(width: width, height: width, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).cornerRadius(8).shadow(radius: 6)
                                    .opacity(model.plansCompleted ? 0.5 : 1.0)
                                        if model.plansCompleted {
                                            Image(systemName: "checkmark.circle").font(.system(size: 30))
                                        }
                                }
                            }).disabled(model.plansCompleted)
                        
                        Text("Write a plan")
                    }
                    Spacer()
                    VStack{
                        NavigationLink(
                            destination: NewAchievementView(model: self.model),
                            label: {
                                ZStack{
                                Image("image4").resizable().frame(width: width, height: width, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).cornerRadius(8).shadow(radius: 6)
                                    .opacity(model.achievementsCompleted ? 0.5 : 1.0)
                                        if model.achievementsCompleted {
                                            Image(systemName: "checkmark.circle").font(.system(size: 30))
                                        }
                                }
                            }).disabled(model.achievementsCompleted)
                        
                        Text("Tell about today's achievements").multilineTextAlignment(.center)
                    }.padding(.top,20)
                }.padding(.horizontal, 34)
                HStack{
                    
                    VStack{
                        NavigationLink(
                            destination: Text(""),
                            label: {
                                ZStack{
                                Image("image3").resizable().frame(width: width, height: width, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).cornerRadius(8).shadow(radius: 6)
                                    .opacity(model.plansCompleted ? 0.5 : 1.0)
                                        if model.plansCompleted {
                                            Image(systemName: "checkmark.circle").font(.system(size: 30))
                                        }
                                }
                            }).disabled(model.plansCompleted)
                        
                        Text("New View 1")
                    }
                    Spacer()
                    VStack{
                        NavigationLink(
                            destination: Text(""),
                            label: {
                                ZStack{
                                Image("image4").resizable().frame(width: width, height: width, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).cornerRadius(8).shadow(radius: 6)
                                    .opacity(model.achievementsCompleted ? 0.5 : 1.0)
                                        if model.achievementsCompleted {
                                            Image(systemName: "checkmark.circle").font(.system(size: 30))
                                        }
                                }
                            }).disabled(model.achievementsCompleted)
                        
                        Text("New View 2").multilineTextAlignment(.center)
                    }.padding(.top,20)
                }.padding(.horizontal, 34)
            }
         
        }
        
    }
}
