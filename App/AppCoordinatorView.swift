//
//  AppCoordinatorView.swift
//  MultipleAuth_2
//
//  Created by admin on 14.10.2022.
//

import SwiftUI
import FirebaseAuth

struct AppCoordinatorView: View {

    var body: some View {
        if Auth.auth().currentUser != nil {
            HomeCoordinatorView(coordinator: HomeCoordinator(viewModel: HomeViewModel()))
        } else {
            LoginCoordinatorView(coordinator: LoginCoordinator(viewModel: LoginViewModel()))
        }
//        switch coordinator.route{
//        case .home:
//            break
//        case .login:
//            break
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AppCoordinatorView()
    }
}
