//
//  GoogleCoordinatorView.swift
//  MultipleAuth_2
//
//  Created by admin on 20.10.2022.
//

import SwiftUI
import SwiftUINavigation

struct GoogleCoordinatorView: View {
    @ObservedObject var coordinator: GoogleCoordinator
    var body: some View {
        NavigationView {
            ZStack {
                GoogleView(viewModel: coordinator.viewModel)
                NavigationLink(
                    unwrapping: $coordinator.route,
                    case: /GoogleCoordinator.Route.HomeScreen,
                    destination: {(coordinator: Binding<HomeCoordinator>) in
                        HomeCoordinatorView(coordinator: coordinator.wrappedValue)
                            .navigationBarHidden(true)
                    },
                    onNavigate: {_ in}) {}
            }
        }
    }
}

