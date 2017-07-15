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
    
    @IBOutlet weak var loginField: LoginFields!
    @IBOutlet weak var passwordField: LoginFields!
    

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

    @IBAction func signInPressed(_ sender: Any) {
        if let email = loginField.text, let pwd = passwordField.text {
            Auth.auth().signIn(withEmail: email, password: pwd, completion: { (user, error) in
                if error == nil {
                    print("Login Successful with E-Mail")
                } else {
                    Auth.auth().createUser(withEmail: email, password: pwd, completion: { (user, error) in
                        if error != nil {
                            print("Unable to authenticate with E-Mail")
                        } else {
                            print("Successfully authenticated with E-Mail")
                        }
                    })
                }
            })
        }
    }
}

