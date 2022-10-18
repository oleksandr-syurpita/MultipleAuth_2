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
            }
        }
    }
}

