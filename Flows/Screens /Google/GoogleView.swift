//
//  GoogleView.swift
//  MultipleAuth_2
//
//  Created by admin on 17.10.2022.
//

import SwiftUI
import AuthenticationServices

struct GoogleView: View {
    @StateObject var viewModel: GoogleViewModel
    var body: some View {
        VStack {
            Button(action: {viewModel.signUpWithGoogle()}) {
                Text("Google")
            }
        }
    }
}

struct GoogleView_Previews: PreviewProvider {
    static var previews: some View {
        GoogleView(viewModel: .init())
    }
}
