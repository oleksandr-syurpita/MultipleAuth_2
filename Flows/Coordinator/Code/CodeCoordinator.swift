//
//  CodeCoordinator.swift
//  MultipleAuth_2
//
//  Created by admin on 14.10.2022.
//

import Foundation

class CodeCoordinator: ObservableObject {
    
    enum Route {
        case navigationHome
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
                self?.moveToCodeSreen()
            case .navigationBack:
                    break
            }
        }
    }
    func moveToCodeSreen() {
        return
    }
}
