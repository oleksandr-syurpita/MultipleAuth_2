//
//  HomeViewModel.swift
//  MultipleAuth_2
//
//  Created by admin on 17.10.2022.
//

import Foundation
import Firebase
import GoogleSignIn

class HomeViewModel: ObservableObject {
    
    func logOut() {
        try? Auth.auth().signOut()
        GIDSignIn.sharedInstance.signOut()
    }
}
