//
//  NewAchievementView.swift
//  FinalProject
//
//  Created by Arlan on 3/15/21.
//

import SwiftUI

struct NewAchievementView: View {
    @ObservedObject var model: LoginViewModel
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @State var text = ""
    @State var str: String = ""
    var body: some View {
        VStack{
            Text("briefly express your achievements of a day 🌟").padding(.top, (UIApplication.shared.windows.first?.safeAreaInsets.top)!+UIScreen.main.bounds.height/6).foregroundColor(.white)

                .padding(.bottom, 40)
            VStack{
                TextEditor(text: $text)
            }.padding().frame(width: UIScreen.main.bounds.width - 40, height: 300, alignment: .center).cornerRadius(16)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.white, lineWidth: 1)
            ).frame(width: UIScreen.main.bounds.width).padding(.bottom)
            
            if text != ""{
            Button {
                model.achievements.append(["date": Date(), "content": text])
                model.achievementsCompleted = true
                model.sendData()
                model.getData()
                self.mode.wrappedValue.dismiss()
            } label: {
                Text("Confirm").foregroundColor(.white).padding(.horizontal, 30).padding(.vertical, 7).background(Color.blue).clipShape(Capsule())
            }
            } else{
                Text("Confirm").foregroundColor(.white).padding(.horizontal, 30).padding(.vertical, 7).background(Color.secondary).clipShape(Capsule())
            }
            Spacer()
        }.background(
            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)), Color(#colorLiteral(red: 0.2282379637, green: 0.0606476727, blue: 0.4235294163, alpha: 1))]), startPoint: .top, endPoint: .bottom)
        )
        .edgesIgnoringSafeArea(.vertical)
        .navigationBarTitle("New Achievement")
        
    }
}
