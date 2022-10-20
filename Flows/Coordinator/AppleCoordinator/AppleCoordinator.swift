//
//  AppleCoordinator.swift
//  MultipleAuth_2
//
//  Created by admin on 20.10.2022.
//

import Foundation

class AppleCoordinator: ObservableObject {
    
    enum Route {
        case homeScreen(homeCoordinator: HomeCoordinator)
    }
    
    @Published var route: Route?
    var viewModel: AppleViewModel
    
    init(viewModel: AppleViewModel) {
        self.viewModel = viewModel
        viewModel.onResult = {[weak self] result in
            switch result {
            case .naviggationToHome:
                self?.moveToHomeScreen()
            }
        }
    }
    
    func moveToHomeScreen() {
        let homeCoordinator = HomeCoordinator(viewModel: HomeViewModel())
        route = .homeScreen(homeCoordinator: homeCoordinator)
    }
}
