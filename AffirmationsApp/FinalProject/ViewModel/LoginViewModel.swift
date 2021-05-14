//
//  LoginViewModel.swift
//  FinalProject
//
//  Created by Arlan on 3/13/21.
//

import Foundation
import SwiftUI



import Firebase // Импортируем SDK Firebase



protocol TransfersData { // Используем протокол обьядинящий все что связано с передачей данных
    func sendData()
    func getData()
}



class LoginViewModel: ObservableObject, TransfersData{
    @Published var email = ""
    @Published var password = ""
    @Published var index = 0
   
    @Published var email_register = ""
    @Published var password_register = ""
    @Published var repassword_register = ""
    
    @Published var date = Date()
    
    @AppStorage("email_stored") var email_stored = ""
    @AppStorage("password_stored") var password_stored = ""
    
    @Published var registered = false
    
    @Published var affirmations : [[String:Any]] = []
    @AppStorage("affirmationCompleted") var affirmationCompleted = false
    @Published var moods : [[String:Any]] = []
    @AppStorage("moodsCompleted") var moodsCompleted = false
    @Published var achievements : [[String:Any]] = []
    @AppStorage("achievementsCompleted") var achievementsCompleted = false
    @Published var plans : [[String:Any]] = []
    @AppStorage("plansCompleted") var plansCompleted = false
    
    @Published var alert = false
    @Published var alertMsg = ""
    
    let db = Firestore.firestore()
    
    func register() {
        if self.email_register != ""{
            if self.password_register == self.repassword_register{
                Auth.auth().createUser(withEmail: self.email_register, password: self.password_register) { (res, err) in
                    if err != nil{
                        self.alert.toggle()
                        self.alertMsg = err!.localizedDescription
                        return
                    }
                    print("success")
                    self.registered.toggle()
                    self.email_register = ""
                    self.password_register = ""
                }
            } else{
                self.alertMsg = "Password mismatch"
                self.alert.toggle()
            }
        } else{
            self.alertMsg = "please fill contents properly"
            self.alert.toggle()
        }
    }
    func getData(){
        let docRef = db.collection("users").document("\(email_stored)")
        
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let data = document.data()
                let date = data?["date"] as! Timestamp
                
                let trueDate = Date(timeIntervalSince1970: TimeInterval(date.seconds))
                if trueDate == Date(){
                    self.affirmationCompleted = false
                    self.plansCompleted = false
                    self.moodsCompleted = false
                    self.achievementsCompleted = false
                }
                
                self.date = trueDate
                self.affirmations = data?["affirmations"] as! [[String : Any]]
                self.achievements = data?["achievements"] as! [[String : Any]]
                self.plans = data?["plans"] as! [[String : Any]]
                self.moods = data?["moods"] as! [[String : Any]]
              //  var newDate = data?["date"] as! Date
              //  print(newDate)
            } else {
                print("Document does not exist")
            }
        }
    }
    func sendData(){
        if self.achievementsCompleted && self.affirmationCompleted && self.moodsCompleted && self.plansCompleted{
            let docData: [String: Any] = [
                "date": Date(),
                "affirmations" : self.affirmations,
                "moods" : self.moods,
                "plans" : self.plans,
                "achievements" : self.achievements
            ]
            db.collection("users").document("\(self.email_stored)").setData(docData) { err in
                if let err = err {
                    print("Error writing document: \(err)")
                } else {
                    print("Document successfully written!")
                }
            }
        } else {
        let docData: [String: Any] = [
            "date" : self.date,
            "affirmations" : self.affirmations,
            "moods" : self.moods,
            "plans" : self.plans,
            "achievements" : self.achievements
        ]
        db.collection("users").document("\(self.email_stored)").setData(docData) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
        }

    }
    
    func delay(interval: TimeInterval, closure: @escaping () -> Void) {
            DispatchQueue.main.asyncAfter(deadline: .now() + interval, execute: closure)
        }
    
    func logout(){
        try! Auth.auth().signOut()
        UserDefaults.standard.set(false, forKey: "status")
        NotificationCenter.default.post(name: NSNotification.Name("status"), object: nil)
        self.affirmationCompleted = false
        self.achievementsCompleted = false
        self.moodsCompleted = false
        self.plansCompleted = false
        self.affirmations = []
        self.achievements = []
        self.plans = []
        self.moods = []
    }
    
    func login() {
        if self.email != "" && self.password != ""{
            
                Auth.auth().signIn(withEmail: self.email, password: self.password) { (res, err) in
                    if err != nil{
                        self.alert.toggle()
                        self.alertMsg = err!.localizedDescription
                        return
                    }
                    print("success")
                    self.email_stored = self.email
                    self.password_stored = self.password
                    
                    UserDefaults.standard.set(true, forKey: "status")
                    NotificationCenter.default.post(name: NSNotification.Name("status"), object: nil)
                }
            }
         else{
            self.alertMsg = "please fill contents properly"
            self.alert.toggle()
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    @Published var affirmation_storage = ["С каждым днем моя жизнь становится все лучше и лучше во всех отношениях.", "Каждый день я притягиваю изобилие и благополучие в свою жизнь.","Моя жизнь гармонична. Я нахожусь в гармонии с жизнью.","Я создаю и притягиваю  наилучшие возможности для себя.","Прямо сейчас моя жизнь меняется к лучшему волшебным образом.","Я живу в потоке удачи, успеха и благополучия.","Каждый день я смело и легко иду к своим целям.","Мое идеальное тело находится в отличной физической форме.","Мое тело здорово, полно жизненной энергии и сил","Я полон желания жить, любить и творить.","Я архитектор своей жизни. Я создатель моей реальности.","Я принимаю и люблю себя таким, какой я есть.", "Меня поддерживает вселенная.", "Я здоров, энергичен и полон счастья.", "Все в моей жизни приведёт к чему-то хорошему.", "Я становлюсь мудрее с каждым днём.", "Я благодарен за все, что происходит в моей жизни.", "Все, что я ищу - я нахожу.","Люблю себя и прекрасно себя чувствую.","Сегодня я отказываюсь от своих негативных по вычел в пользу позитивных.","Я с радостью встречаю вызовы, и мой потенциал справиться с ними безграничен.","Я прощаю всех, кто причинил мне боль в прошлом.","Я верю, что могу все.","Сегодня меня переполняет позитивный настрой.","Я прекрасный человек, потому что я - это я. ","Моя мантра: классно быть мной. Жизнь прекрасна и она становится все интереснее с каждым днем.","Я сама определяю своё будущее. Я — хозяин своей жизни.","Мои решения самые верные, интуиция подсказывает направление моего пути.","Я отпускаю все сомнения и страхи.","Я благодарен за все деньги, которые приходят ко мне легко и без усилий.", "Я в гармонии с большим потоком денег."]
    
    
}
