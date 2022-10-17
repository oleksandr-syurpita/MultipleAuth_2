//
//  CodeCoordinatorView.swift
//  MultipleAuth_2
//
//  Created by admin on 14.10.2022.
//

import SwiftUI

struct CodeCoordinatorView: View {
    @ObservedObject var coordinator: CodeCoordinator
    var body: some View {
        NavigationView {
            ZStack {
                CodeView(viewModel: coordinator.viewModel)
                
            }
        }
    }
}

