//
//  AllAffirmations.swift
//  FinalProject
//
//  Created by Arlan on 3/15/21.
//

import SwiftUI
import Firebase
struct AllAffirmationsView: View {
    @ObservedObject var model: LoginViewModel
    let columns = [GridItem(.adaptive(minimum: 160)), GridItem(.adaptive(minimum: 160, maximum: 200))]
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @State var text = ""
    @State var str: String = ""
    func dateFormatter(i: Int) -> String{
        let date = model.affirmations[i]["date"] as! Timestamp
        
        let trueDate = Date(timeIntervalSince1970: TimeInterval(date.seconds))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd" //Specify your format that you want
        let strDate = dateFormatter.string(from: trueDate)
        return strDate
    }
    var body: some View {
        VStack{
            ScrollView{
                LazyVGrid(columns: columns) {
                    ForEach(0..<model.affirmations.count, id: \.self){i in
                    VStack{
                        HStack{
                            Image(systemName: "scribble.variable").font(.system(size: 15))
                           Spacer()
                        }
                        Spacer()
                        Text(model.affirmations[i]["content"] as! String).font(.system(size: 12))
                        Spacer()
                        HStack{
                        Text(dateFormatter(i: i)).font(.caption)
                            Spacer()
                        }
                    }.foregroundColor(.white).padding(.horizontal).padding(.vertical).frame(width: 160, height: 160, alignment: .center).background(Color.black).cornerRadius(8)
                    }
                }
            }.padding(.top, (UIApplication.shared.windows.first?.safeAreaInsets.top)!+UIScreen.main.bounds.height/6)
        }.background(
            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)), Color(#colorLiteral(red: 0.2282379637, green: 0.0606476727, blue: 0.4235294163, alpha: 1))]), startPoint: .top, endPoint: .bottom)
        )
        .edgesIgnoringSafeArea(.vertical)
        .navigationBarTitle("Affirmations")
        
    }
}
