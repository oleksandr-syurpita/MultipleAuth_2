//
//  LoginView.swift
//  MultipleAuth_2
//
//  Created by admin on 13.10.2022.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var viewModel: LoginViewModel
    var body: some View {
        ZStack {
            VStack {
                TextField("Login", text: $viewModel.email)
                    .padding([.leading],30)
                    .background(Color.red.opacity(0.5))
                    .cornerRadius(.infinity)
                    .padding([.trailing],30)
                TextField("password", text: $viewModel.password)
                    .padding([.leading],30)
                    .background(Color.red.opacity(0.5))
                    .cornerRadius(.infinity)
                    .padding([.trailing],30)
                HStack {
                    Button(action: {viewModel.signUpEmail(email: viewModel.email, password: viewModel.password) { verify, status in
                        if !verify {
                            //add alert for error
                        } else {
                            viewModel.moveToHomeScreen()

                        }
                    }}) {
                        Text("Create user")
                            .padding([.leading,.trailing],30)
                            .background(Color.blue.opacity(0.5))
                            .cornerRadius(.infinity)
                    }
                    
                    Button(action: {viewModel.signAuthorizationLogin(email: viewModel.email, password: viewModel.password) { verify, status in
                        if !verify {
                            //add alert for error
                        } else {
                            viewModel.moveToHomeScreen()
                        }
                    }}) {
                        Text("Login email user")
                            .padding([.leading,.trailing],30)
                            .background(Color.blue.opacity(0.5))
                            .cornerRadius(.infinity)
                    }
                }
                HStack(spacing: 20) {
                    
                    Button(action: {viewModel.moveToGoogleScreen()}) {
                        Image("Google")
                            .resizable()
                            .frame(width: 50,height: 50)
                    }
                    
                    Button(action: {viewModel.moveToAppleScreen()}) {
                        Image(systemName: "applelogo")
                            .resizable()
                            .frame(width: 50,height: 50)
                            .padding(.bottom,10)
                    }
                    
                    Button(action: {viewModel.moveToPhoneScreen()}) {
                        Image(systemName: "phone")
                            .resizable()
                            .frame(width: 40,height: 50)
                    }
                }
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(viewModel: .init())
    }
}
