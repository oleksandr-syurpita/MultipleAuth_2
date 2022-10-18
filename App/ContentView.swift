//
//  ContentView.swift
//  MultipleAuth_2
//
//  Created by admin on 14.10.2022.
//

import SwiftUI

struct ContentView: View {
    @State var log_Status = UserDefaults.standard.value(forKey: "log_status") as? Bool ?? false

    var body: some View {
        if log_Status {
            HomeCoordinatorView(coordinator: HomeCoordinator(viewModel: HomeViewModel()))
        } else {
            LoginCoordinatorView(coordinator: LoginCoordinator(viewModel: LoginViewModel()))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
