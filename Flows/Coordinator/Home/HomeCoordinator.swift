//
//  HomeCoordinator.swift
//  MultipleAuth_2
//
//  Created by admin on 17.10.2022.
//

import Foundation

class HomeCoordinator: ObservableObject {
    
    enum Result {
        case navigationBack
    }
    
    var onResult:((Result) -> Void)?
    
    var viewModel:HomeViewModel
    
    init(viewModel:HomeViewModel) {
        self.viewModel = viewModel
        viewModel.onResult = {[weak self] result in
            switch result {
                
            case .navigationBack:
                self?.onResult?(.navigationBack)
            }
        }
    }
}
