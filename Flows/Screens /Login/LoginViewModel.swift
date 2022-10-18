//
//  LoginViewModel.swift
//  MultipleAuth_2
//
//  Created by admin on 14.10.2022.
//

import Foundation
import Firebase

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""

    enum Result {
        case navigationToPhoneScreen
        case navigationToAppleScreen
        case navigationToGoogleScreen
        case navigationToHomeScreen
    }
    
    var onResult:((Result) -> Void)?
    
    func moveToHomeScreen() {
        onResult?(.navigationToHomeScreen)
    }
    func moveToPhoneScreen() {
        onResult?(.navigationToPhoneScreen)
    }
    
    func moveToAppleScreen() {
        onResult?(.navigationToAppleScreen)
    }
    
    func moveToGoogleScreen() {
        onResult?(.navigationToGoogleScreen)
    }
    
    func signAuthorizationLogin(email: String, password: String,complete: @escaping (Bool, String) -> Void) {
        
        Auth.auth().signIn(withEmail: email, password: password) {
            (result, error) in
            if error != nil {
                complete(false, (error?.localizedDescription)!)
                return
            }
            complete(true, (result?.user.email)!)
        }
    }
    
    func signUpEmail(email:String, password: String, complete: @escaping (Bool,String) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) {
            (result, error) in
            if error != nil {
                complete(false,(error?.localizedDescription)!)
                return
            }
            complete(true,(result?.user.email)!)
        }
    }
}
