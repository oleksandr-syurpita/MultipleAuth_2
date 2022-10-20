//
//  LoginCoordinator.swift
//  MultipleAuth_2
//
//  Created by admin on 14.10.2022.
//

import Foundation

class LoginCoordinator: ObservableObject {
    enum Route {
        case googleScreen
        case appleScreen
        case phoneScreen(phoneCoordinator: PhoneCoordinator)
        case homeScreen(homeCoordinator: HomeCoordinator)
    }
    
    
    @Published var route: Route?
    var viewModel: LoginViewModel
    
    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
        viewModel.onResult = { [weak self] result in
            switch result {
                
            case .navigationToPhoneScreen:
                self?.moveToPhoneScreen()
            case .navigationToAppleScreen:
                break
            case .navigationToGoogleScreen:
                break
            case .navigationToHomeScreen:
                self?.moveToHomeScreen()
            }
        }
    }
    
    func moveToGoogleScreen() {
        let googleCoordinator = Google
        
        route = .phoneScreen(phoneCoordinator: phoneCoordinator)
    }
    func moveToAppleScreen() {
        let phoneCoordinator = PhoneCoordinator(viewModel: PhoneViewModel())
        
        route = .phoneScreen(phoneCoordinator: phoneCoordinator)
    }
    
    func moveToPhoneScreen() {
        let phoneCoordinator = PhoneCoordinator(viewModel: PhoneViewModel())
        
        route = .phoneScreen(phoneCoordinator: phoneCoordinator)
    }
    
    func moveToHomeScreen() {
        let homeCoordinator = HomeCoordinator(viewModel: HomeViewModel())
        
        route = .homeScreen(homeCoordinator: homeCoordinator)
    }
}
