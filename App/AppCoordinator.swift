//
//  AppCoordinator.swift
//  MultipleAuth_2
//
//  Created by admin on 20.10.2022.
//

import Foundation
import FirebaseAuth
class AppCoordinator: ObservableObject {
    
    enum Route {
        case homeScreen(homeCoordinator: HomeCoordinator)
        case loginScreen(loginCoordinator: LoginCoordinator)
    }
    
    @Published var route: Route?

    var loginViewModel: LoginViewModel
    var homeViewModel: HomeViewModel
    
    init(loginViewModel: LoginViewModel, homeViewModel: HomeViewModel) {
        self.homeViewModel = homeViewModel
        self.loginViewModel = loginViewModel
        
        if Auth.auth().currentUser != nil {
            moveToHomeScreen()
            
        } else {
            moveToLoginScreen()
        }
    }
    
    func moveToHomeScreen() {
        let homeScreen = HomeCoordinator(viewModel: HomeViewModel())
        route = .homeScreen(homeCoordinator: homeScreen)
    }
    
    func moveToLoginScreen() {
        let loginScreen = LoginCoordinator(viewModel: LoginViewModel())
        
        route = .loginScreen(loginCoordinator: loginScreen)
    }
    
}
