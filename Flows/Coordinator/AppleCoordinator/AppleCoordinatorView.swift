//
//  AppleCoordinatorView.swift
//  MultipleAuth_2
//
//  Created by admin on 20.10.2022.
//

import SwiftUI
import SwiftUINavigation

struct AppleCoordinatorView: View {
    @ObservedObject var coordinator: AppleCoordinator
    var body: some View {
        NavigationView {
            ZStack {
                AppleView(viewModel: coordinator.viewModel)
                NavigationLink(
                    unwrapping: $coordinator.route,
                    case: /AppleCoordinator.Route.homeScreen,
                    destination: {(coordinator: Binding<HomeCoordinator>) in
                        HomeCoordinatorView(coordinator: coordinator.wrappedValue)
                            .navigationBarHidden(true)
                    },
                    onNavigate: {_ in}) {}
            }
        }
    }
}

