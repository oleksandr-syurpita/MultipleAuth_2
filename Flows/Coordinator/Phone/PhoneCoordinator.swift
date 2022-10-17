//
//  PhoneCoordinator.swift
//  MultipleAuth_2
//
//  Created by admin on 14.10.2022.
//

import Foundation

class PhoneCoordinator: ObservableObject {
    
    enum Route {
        case navigationToCodeScreen(codeCoordinator: CodeCoordinator)
    }
    
    @Published var route: Route?
    
    var viewModel: PhoneViewModel
    
    init(viewModel: PhoneViewModel) {
        self.viewModel = viewModel
        viewModel.onResult = { [weak self] result in
            switch result {
                
            case .navigationOTP(let id):
                self?.moveToCodeScreen(id: id)
            }
        }
    }
    
    func moveToCodeScreen(id: String) {
        let codeCoordinator = CodeCoordinator(viewModel: CodeViewModel(id: id))
        
    }
}
