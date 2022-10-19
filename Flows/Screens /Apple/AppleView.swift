//
//  AppleView.swift
//  MultipleAuth_2
//
//  Created by admin on 17.10.2022.
//

import SwiftUI
import CryptoKit
import AuthenticationServices
import FirebaseAuth
struct AppleView: View {
    //    @EnvironmentObject var viewModel: AppleViewModel
    @ObservedObject var viewModel: AppleViewModel
    
    var body: some View {
        ZStack {
            VStack {
                SignInWithAppleButton { request in
                    let nonce = viewModel.randomNonceString()
                    viewModel.currentNonce = nonce
                    
                    request.requestedScopes = [.fullName, .email]
                    request.nonce = viewModel.sha256(nonce)
                } onCompletion: { result in
                    switch result {
                    case .success(let authResults):
                        switch authResults.credential {
                        case let appleIDCredential as ASAuthorizationAppleIDCredential:
                            
                            guard let nonce = viewModel.currentNonce else {
                                fatalError("Invalid state: A login callback was received, but no login request was sent.")
                            }
                            guard let appleIDToken = appleIDCredential.identityToken else {
                                fatalError("Invalid state: A login callback was received, but no login request was sent.")
                            }
                            guard let idTokenString = String(data: appleIDToken, encoding: .utf8) else {
                                print("Unable to serialize token string from data: \(appleIDToken.debugDescription)")
                                return
                            }
                            
                            let credential = OAuthProvider.credential(withProviderID: "apple.com",idToken: idTokenString,rawNonce: nonce)
                            Auth.auth().signIn(with: credential) { (authResult, error) in
                                if (error != nil) {
                                    // Error. If error.code == .MissingOrInvalidNonce, make sure
                                    // you're sending the SHA256-hashed nonce as a hex string with
                                    // your request to Apple.
                                    print(error?.localizedDescription as Any)
                                    return
                                }
                                print("signed in")
                                viewModel.loginApple()
                            }
                            
                            print("\(String(describing: Auth.auth().currentUser?.uid))")
                        default:
                            break
                            
                        }
                    default:
                        break
                    }
                }
                Image(systemName: "apple.logo")
                    .frame(width: 50,height: 50)
                
            }
        }
    }
}

struct AppleView_Previews: PreviewProvider {
    static var previews: some View {
        AppleView(viewModel: .init())
    }
}
