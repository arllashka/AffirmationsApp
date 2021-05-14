//
//  NewAffiramtionView.swift
//  FinalProject
//
//  Created by Arlan on 3/15/21.
//

import SwiftUI

struct NewAffirmationView: View {
    @ObservedObject var model: LoginViewModel
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @State var show = false
    @State var str: String = ""
    var body: some View {
        VStack{
            Text("repeat this affirmation 3 times ☀️").padding(.top, (UIApplication.shared.windows.first?.safeAreaInsets.top)!+UIScreen.main.bounds.height/6).foregroundColor(.white)

                .padding(.bottom, 40)
            VStack{
                Text(str).foregroundColor(.white)
            }.padding()
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.white, lineWidth: 1)
            ).padding(.horizontal).frame(width: UIScreen.main.bounds.width)
            .padding(.bottom, 100)
            
            if show{
            Button {
                model.affirmations.append(["date": Date(), "content": str])
                model.affirmationCompleted = true
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
        .navigationBarTitle("New Affirmation")
        .onAppear {
            // Random  - - Int.random(in:)
            str = model.affirmation_storage[Int.random(in:  0..<model.affirmation_storage.count)]
            model.delay(interval: 5){
                self.show.toggle()
                
            }
        }
    }
}
//.padding(.top, (UIApplication.shared.windows.first?.safeAreaInsets.top)!+24)
