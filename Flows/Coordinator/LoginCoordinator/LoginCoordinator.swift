//
//  LoginCoordinator.swift
//  MultipleAuth_2
//
//  Created by admin on 14.10.2022.
//

import Foundation

class LoginCoordinator: ObservableObject {
    
    enum Route {
        case googleScreen(googleCoordinator: GoogleCoordinator)
        case appleScreen(appleCoordinator: AppleCoordinator)
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
                self?.moveToAppleScreen()
            case .navigationToGoogleScreen:
                self?.moveToGoogleScreen()
            case .navigationToHomeScreen:
                self?.moveToHomeScreen()
            }
        }
    }
    
    func moveToGoogleScreen() {
        let googleCoordinator = GoogleCoordinator(viewModel: GoogleViewModel())
        
        route = .googleScreen(googleCoordinator: googleCoordinator)
    }
    
    func moveToAppleScreen() {
        let appleCoordinator = AppleCoordinator(viewModel: AppleViewModel())
        
        route = .appleScreen(appleCoordinator: appleCoordinator)
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
