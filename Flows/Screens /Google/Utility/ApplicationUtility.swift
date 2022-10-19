//
//  ApplicationUtility.swift
//  MultipleAuth_2
//
//  Created by admin on 19.10.2022.
//

import SwiftUI
import GoogleSignIn


final class ApplicationUtility {
    
    static var rootViewController: UIViewController {
        
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .init()
        }
        
        guard let root = screen.windows.first?.rootViewController else {
            return .init()
        }
        
        return root
    }
}
