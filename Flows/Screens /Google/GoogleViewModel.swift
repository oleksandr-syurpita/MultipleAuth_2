import FirebaseAuth
import FirebaseCore
import GoogleSignIn
import SwiftUI


class GoogleViewModel: ObservableObject {

    enum Result {
        case navigationHome
    }
    
    var onResult:((Result) -> Void)?
    
    func moveToHomeScreen() {
        onResult?(.navigationHome)
    }
    
    func signUpWithGoogle() {
        // get up client id
        guard let clientID = FirebaseApp.app()?.options.clientID else {return}

        // get configuration
        let config = GIDConfiguration(clientID: clientID)
        
        guard let viewController = UIApplication.shared.hackKeyWindow?.rootViewController else {
            return
        }

        //Sign In

        GIDSignIn.sharedInstance.signIn(with: config, presenting: viewController) {
            [self] user, err in

            if let error = err {
                print(error.localizedDescription)
                return
            }

            guard
                let authentication = user?.authentication,
                let idToken = authentication.idToken
            else { return }

            let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: authentication.accessToken)

            Auth.auth().signIn(with: credential) { result, error in

                if let err = error {
                    print(err.localizedDescription)
                    
                }

                guard let user = result?.user else  { return }
                print(user.displayName as Any) // MARK
            }
            self.moveToHomeScreen()
        }
    }
}

extension UIApplication {

    var hackKeyWindow: UIWindow? {
        // Get connected scenes
        return UIApplication.shared.connectedScenes
            // Keep only the first `UIWindowScene`
            .first(where: { $0 is UIWindowScene })
            // Get its associated windows
            .flatMap({ $0 as? UIWindowScene })?.windows
            // Finally, keep only the key window
            .first(where: \.isKeyWindow)
    }
}
