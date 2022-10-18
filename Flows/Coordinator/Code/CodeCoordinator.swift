//
//  CodeCoordinator.swift
//  MultipleAuth_2
//
//  Created by admin on 14.10.2022.
//

import Foundation

class CodeCoordinator: ObservableObject {
    
    enum Route {
        case navigationHome(homeCoordinator: HomeCoordinator)
        case navigationBack
    }
    
    enum Result {
        case navigationBack
    }
    
    var onResult:((Result) -> Void)?
    
    @Published var route: Route?
    
    var viewModel: CodeViewModel
    init(viewModel: CodeViewModel) {
        self.viewModel = viewModel
        viewModel.onResult = { [weak self] result in
            switch result {
                
            case .navigationHome:
                self?.moveToHomeSreen()
            case .navigationBack:
                self?.onResult?(.navigationBack)
            }
        }
    }
    func moveToHomeSreen() {
        let coordinator = HomeCoordinator(viewModel: HomeViewModel())
        coordinator.onResult = {[weak self] result in
            switch result {
                
            case .navigationBack:
                    self?.route = nil
            }
        }
        route = .navigationHome(homeCoordinator: coordinator)
    }
}
