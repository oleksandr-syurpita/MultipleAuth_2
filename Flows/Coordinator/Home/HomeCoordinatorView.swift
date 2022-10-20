//
//  HomeCoordinatorView.swift
//  MultipleAuth_2
//
//  Created by admin on 17.10.2022.
//

import SwiftUI
import SwiftUINavigation
struct HomeCoordinatorView: View {
    @ObservedObject var coordinator: HomeCoordinator
    var body: some View {
        NavigationView {
            ZStack {
                HomeView(viewModel: coordinator.viewModel)
                NavigationLink(
                    unwrapping: $coordinator.route,
                    case: /HomeCoordinator.Route.loginScreen,
                    destination: {(coordinator: Binding<LoginCoordinator>)in
                        LoginCoordinatorView(coordinator: coordinator.wrappedValue)
                            .navigationBarHidden(true)
                    }, onNavigate: {_ in}) {}
            }
        }
    }
}

