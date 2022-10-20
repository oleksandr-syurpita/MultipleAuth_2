//
//  HomeCoordinator.swift
//  MultipleAuth_2
//
//  Created by admin on 17.10.2022.
//

import Foundation

class HomeCoordinator: ObservableObject {
    
    enum Route {
        case loginScreen(LoginCoordinator: LoginCoordinator)
    }
    
    @Published var route: Route?
    
    var viewModel:HomeViewModel
    
    init(viewModel:HomeViewModel) {
        self.viewModel = viewModel
        viewModel.onResult = {[weak self] result in
            switch result {
            case .navigationBack:
                self?.moveToLoginScreen()
            }
        }
    }
    
    func moveToLoginScreen() {
        let loginCoordinator = LoginCoordinator(viewModel:LoginViewModel())
        route = .loginScreen(LoginCoordinator: loginCoordinator)
    }
}
