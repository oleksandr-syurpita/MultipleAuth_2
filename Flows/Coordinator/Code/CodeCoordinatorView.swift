//
//  CodeCoordinatorView.swift
//  MultipleAuth_2
//
//  Created by admin on 14.10.2022.
//

import SwiftUI
import SwiftUINavigation
struct CodeCoordinatorView: View {
    @ObservedObject var coordinator: CodeCoordinator
    var body: some View {
        NavigationView {
            ZStack {
                CodeView(viewModel: coordinator.viewModel)
                NavigationLink(
                    unwrapping: $coordinator.route,
                    case: /CodeCoordinator.Route.navigationHome,
                    destination: {(coordinator: Binding<HomeCoordinator>) in
                        HomeCoordinatorView(coordinator: coordinator.wrappedValue)
                            .navigationBarHidden(true)
                    },
                    onNavigate: {_ in}) {}
            }
        }
    }
}

