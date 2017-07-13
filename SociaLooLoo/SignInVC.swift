//
//  SignInVC.swift
//  SociaLooLoo
//
//  Created by John Peppe on 7/11/17.
//  Copyright © 2017 John Peppe. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import Firebase

class SignInVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    @IBAction func facebookBtnPressed(_ sender: Any) {
        let facebookLogin = FBSDKLoginManager()
        facebookLogin.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
            if error != nil {
                print("Unable to Authenticate with Facebook")
            } else if result?.isCancelled == true {
                print("User Cancelled Login")
            } else {
                print("Login Successful")
                let credential = FacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                self.firebaseAuth(credential)
            }
        }
        
    }
    
    func firebaseAuth(_ credential: AuthCredential) {
        Auth.auth().signIn(with: credential, completion: { (user, error) in
            if error != nil {
                print("Unable to Sign-In with E-Mail")
            } else {
                print("Successfully Logged In")
            }
        }
    )}

}

