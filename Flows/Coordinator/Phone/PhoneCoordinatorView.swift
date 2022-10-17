//
//  PhoneCoordinatorView.swift
//  MultipleAuth_2
//
//  Created by admin on 14.10.2022.
//

import SwiftUI

struct PhoneCoordinatorView: View {
    @ObservedObject var coordinator: PhoneCoordinator
    var body: some View {
        NavigationView {
            ZStack {
                PhoneView(viewModel: coordinator.viewModel)
                
            }
        }
    }
}

