//
//  AppCoordinatorView.swift
//  MultipleAuth_2
//
//  Created by admin on 14.10.2022.
//

import SwiftUI
import FirebaseAuth
import SwiftUINavigation

struct AppCoordinatorView: View {
    @ObservedObject var coordinator: AppCoordinator
    var body: some View {
        NavigationView {
            ZStack {
                switch  coordinator.route {
                case .loginScreen(let loginCoordinator):
                    LoginCoordinatorView(coordinator: loginCoordinator)
                case .homeScreen(let homeCoordinator):
                    HomeCoordinatorView(coordinator: homeCoordinator)
                case .none:
                    EmptyView()
                }
            }
        }
    }
}

//if Auth.auth().currentUser != nil {
//    HomeCoordinatorView(coordinator: HomeCoordinator(viewModel: HomeViewModel()))
//} else {
//    LoginCoordinatorView(coordinator: LoginCoordinator(viewModel: LoginViewModel()))
//}
//case .navigationMain:
//    HomeView(viewModel: coordinator.homeViewModel)
//case .none:
//    EmptyView()
