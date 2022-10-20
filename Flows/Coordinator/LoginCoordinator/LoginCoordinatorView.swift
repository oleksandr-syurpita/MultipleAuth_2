//
//  LoginCoordinatorView.swift
//  MultipleAuth_2
//
//  Created by admin on 14.10.2022.
//

import SwiftUI
import SwiftUINavigation
struct LoginCoordinatorView: View {
    @ObservedObject var coordinator: LoginCoordinator
    var body: some View {
        NavigationView {
            ZStack {
                LoginView(viewModel: coordinator.viewModel)
                NavigationLink(
                    unwrapping: $coordinator.route,
                    case: /LoginCoordinator.Route.phoneScreen,
                    destination: {(coordinator: Binding<PhoneCoordinator>)in
                        PhoneCoordinatorView(coordinator: coordinator.wrappedValue)
                    }, onNavigate: { _ in}) {}
                
                NavigationLink(
                    unwrapping: $coordinator.route,
                    case: /LoginCoordinator.Route.homeScreen,
                    destination: {(coordinator: Binding<HomeCoordinator>)in
                        HomeCoordinatorView(coordinator: coordinator.wrappedValue)
                            .navigationBarHidden(true)
                    }, onNavigate: { _ in}) {}
                
                NavigationLink(
                    unwrapping: $coordinator.route,
                    case: /LoginCoordinator.Route.appleScreen,
                    destination: {(coordinator: Binding<AppleCoordinator>)in
                        AppleCoordinatorView(coordinator: coordinator.wrappedValue)
                    }, onNavigate: { _ in}) {}
                
                NavigationLink(
                    unwrapping: $coordinator.route,
                    case: /LoginCoordinator.Route.googleScreen,
                    destination: {(coordinator: Binding<GoogleCoordinator>)in
                        GoogleCoordinatorView(coordinator: coordinator.wrappedValue)
                            .navigationBarHidden(true)
                    }, onNavigate: { _ in}) {}
            }
        }
    }
}

