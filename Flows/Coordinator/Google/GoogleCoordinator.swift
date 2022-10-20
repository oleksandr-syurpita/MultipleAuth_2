//
//  GoogleCoordinator.swift
//  MultipleAuth_2
//
//  Created by admin on 20.10.2022.
//

import Foundation

class GoogleCoordinator: ObservableObject {
    
    enum Route {
        case HomeScreen(homeCoordinator: HomeCoordinator)
    }
    
    @Published var route: Route?
    var viewModel: GoogleViewModel
    
    init(viewModel:GoogleViewModel) {
        self.viewModel = viewModel
        viewModel.onResult = {[weak self] result in
            switch result {
                
            case .navigationHome:
                self?.moveToHomeScreen()
            }
        }
    }
    
    func moveToHomeScreen() {
        let homeCoordinator = HomeCoordinator(viewModel: HomeViewModel())
        route = .HomeScreen(homeCoordinator: homeCoordinator)
    }
}
