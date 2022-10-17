//
//  LoginCoordinatorView.swift
//  MultipleAuth_2
//
//  Created by admin on 14.10.2022.
//

import SwiftUI

struct LoginCoordinatorView: View {
    @ObservedObject var coordinator: LoginCoordinator
    var body: some View {
        NavigationView {
            ZStack {
                LoginView(viewModel: coordinator.viewModel)
            }
        }
    }
}

