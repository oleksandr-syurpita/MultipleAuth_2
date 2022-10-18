//
//  PhoneCoordinatorView.swift
//  MultipleAuth_2
//
//  Created by admin on 14.10.2022.
//

import SwiftUI
import SwiftUINavigation
struct PhoneCoordinatorView: View {
    @ObservedObject var coordinator: PhoneCoordinator
    var body: some View {
        NavigationView {
            ZStack {
                PhoneView(viewModel: coordinator.viewModel)
                 NavigationLink(
                    unwrapping: $coordinator.route,
                    case: /PhoneCoordinator.Route.navigationToCodeScreen,
                    destination: {(coordinator: Binding<CodeCoordinator>) in
                        CodeCoordinatorView(coordinator: coordinator.wrappedValue)
                            .navigationBarHidden(true)
                    },
                    onNavigate: {_ in}) { }
            }
        }
    }
}

