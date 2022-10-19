//
//  GoogleView.swift
//  MultipleAuth_2
//
//  Created by admin on 17.10.2022.
//

import SwiftUI
import AuthenticationServices
import GoogleSignIn
import GoogleSignInSwift

struct GoogleView: View {
    @StateObject var viewModel: GoogleViewModel
    var body: some View {
        VStack {
            GoogleSignInButton {

            }
        }
    }
}

struct GoogleView_Previews: PreviewProvider {
    static var previews: some View {
        GoogleView(viewModel: .init())
    }
}
