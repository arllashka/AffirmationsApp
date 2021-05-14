//
//  MenuView.swift
//  FinalProject
//
//  Created by Arlan on 3/15/21.
//

import SwiftUI

struct MenuView: View {
    @ObservedObject var model: LoginViewModel
    var body: some View {
        VStack{
            NavigationLink(
                destination: AllAffirmationsView(model: self.model),
                label: {
                    HStack{
                        Image(systemName: "star.circle").font(.system(size: 20)).padding(.trailing)
                        Text("Affirmations").foregroundColor(.white)
                        Spacer()
                        Image(systemName: "arrow.right").foregroundColor(Color(UIColor.lightGray))
                    }.padding(.horizontal).padding(.vertical).padding(.top)
                })
            
            
            Rectangle().frame(height: 1).foregroundColor(Color(UIColor.lightGray))
            NavigationLink(
                destination: AllMoodsView(model: self.model),
                label: {
            HStack{
                Image(systemName: "note.text.badge.plus").font(.system(size: 20)).padding(.trailing)
                Text("Mood").foregroundColor(.white)
                Spacer()
                Image(systemName: "arrow.right").foregroundColor(Color(UIColor.lightGray))
            }.padding(.horizontal).padding(.vertical)})
            
            Rectangle().frame(height: 1).foregroundColor(Color(UIColor.lightGray))
            NavigationLink(
                destination: AllPlansView(model: self.model),
                label: {
            HStack{
                Image(systemName: "apps.iphone").font(.system(size: 20)).padding(.trailing)
                Text("Plans").foregroundColor(.white)
                Spacer()
                Image(systemName: "arrow.right").foregroundColor(Color(UIColor.lightGray))
            }.padding(.horizontal).padding(.vertical)})
            
            
            
            Rectangle().frame(height: 1).foregroundColor(Color(UIColor.lightGray))
            NavigationLink(
                destination: AllAchievementsView(model: self.model),
                label: {
            HStack{
                Image(systemName: "heart.text.square").font(.system(size: 20)).padding(.trailing)
                Text("Achievements").foregroundColor(.white)
                Spacer()
                Image(systemName: "arrow.right").foregroundColor(Color(UIColor.lightGray))
            }.padding(.horizontal).padding(.vertical).padding(.bottom)})
            
           
        }.frame(width: UIScreen.main.bounds.width - 40).background(Color(#colorLiteral(red: 0.149002701, green: 0.1490303874, blue: 0.148996681, alpha: 1))).cornerRadius(12)
    }
}


