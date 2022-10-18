//
//  HomeView.swift
//  MultipleAuth_2
//
//  Created by admin on 17.10.2022.
//

import SwiftUI
import Firebase

struct HomeView: View {
    @State var log_Status = UserDefaults.standard.value(forKey: "log_status") as? Bool ?? false
    @ObservedObject var viewModel: HomeViewModel
    var body: some View {
        ZStack {
            VStack {
                Text("Welcome")
                Button("LogOut") {
                    viewModel.logOut()
                    withAnimation(.easeInOut) {
                        log_Status = false
                    }
                    }
                }
            }
        }
    }


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: .init())
    }
}
