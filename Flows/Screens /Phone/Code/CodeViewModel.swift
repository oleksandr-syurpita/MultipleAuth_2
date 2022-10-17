//
//  CodeViewModel.swift
//  MultipleAuth_2
//
//  Created by admin on 14.10.2022.
//

import Foundation
import Firebase
import FirebaseAuth

class CodeViewModel: ObservableObject {
    
    @Published var showAlert = false
    @Published var alertMsg = ""
    @Published var code = String()

    let id: String

    init(id: String) {
        self.id = id
    }
    enum Result {
        case navigationHome
        case navigationBack
    }
    
    var onResult:((Result) -> Void)?
    
    func moveToHomeScreen() {
        onResult?(.navigationHome)
    }
    
    func moveToBack() {
        onResult?(.navigationBack)
    }
    
    func verifyOTP() {
        let credential = PhoneAuthProvider.provider().credential(withVerificationID: id, verificationCode: code)
        Auth.auth().signIn(with: credential) { result, err in
            if let err = err {
                self.handleError(error: err)
                return
            }
            
            self.alertMsg = "Success"
            self.moveToHomeScreen()
            self.showAlert.toggle()
        }
    }

    func handleError(error: Error?) {
        if let error = error {
            alertMsg = error.localizedDescription
            showAlert.toggle()
            return
        }
    }

}
