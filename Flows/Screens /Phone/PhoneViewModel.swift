//
//  PhoneViewModel.swift
//  MultipleAuth_2
//
//  Created by admin on 14.10.2022.
//

import Foundation
import Firebase
import FirebaseAuth

class PhoneViewModel: ObservableObject {
    
    @Published var phone = ""
    @Published var showAlert = false
    @Published var alertMsg = ""
    
    var id: String = String()
    
    enum Result {
        case navigationOTP(id: String)
    }
    var onResult:((Result) -> Void)?
    //    @Published var navigateOTP = false // navigation
    
    func sendOTP() { // OTP
        PhoneAuthProvider.provider().verifyPhoneNumber(phone, uiDelegate: nil) { verificationId, err in
            if let error = err {
                self.handleError(error: error)
            }
            else if let id = verificationId {
                self.id = id
                self.moveTonavigationOTP()
            }
        }
    }
    
    func moveTonavigationOTP() {
        onResult?(.navigationOTP(id: id))
        
    }
    
    func handleError(error:Error?) {
        if let error = error {
            alertMsg = error.localizedDescription
            showAlert.toggle()
            return
        }
    }
    
}
