//
//  NewPlanView.swift
//  FinalProject
//
//  Created by Arlan on 3/15/21.
//

import SwiftUI

struct NewPlanView: View {
    @ObservedObject var model: LoginViewModel
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @State var show = false
    @State var list : [String] = []
    @State var text = ""
    @State var str: String = ""
    var body: some View {
        VStack{
            Text("write your plan 🤓").padding(.top, (UIApplication.shared.windows.first?.safeAreaInsets.top)!+UIScreen.main.bounds.height/6).foregroundColor(.white)

                .padding(.bottom, 40)
            
            TextField("Напишите задачу", text: $text).padding(.horizontal).frame(width: UIScreen.main.bounds.width - 30, height: 40, alignment: .leading).background(Color.white).cornerRadius(10).frame(width: UIScreen.main.bounds.width)
            if list.count <= 10{
            Button {
                list.append(text)
                text = ""
            } label: {
                Text("Add").foregroundColor(.white).padding(.horizontal, 30).padding(.vertical, 7).background(Color.yellow).clipShape(Capsule())
            }.padding(.vertical, 8).disabled(text == "")
            }
            
            VStack(alignment: .leading, spacing: 0){
                ForEach(list, id: \.self){i in
                    HStack{
                        Image(systemName: "checkmark.circle")
                            .padding(.trailing)
                        Text(i)
                        Spacer()
                    }.frame(width: UIScreen.main.bounds.width - 40).padding(.vertical, 8).background(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))).padding(.leading)
                    Divider()
                }
            }.cornerRadius(8)
            
            if !list.isEmpty{
                Button {
                    model.plans.append(["date": Date(), "content": list])
                    model.plansCompleted = true
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
            
        }
    }
}
