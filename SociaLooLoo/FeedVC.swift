//
//  FeedVC.swift
//  SociaLooLoo
//
//  Created by John Peppe on 7/15/17.
//  Copyright © 2017 John Peppe. All rights reserved.
//

import UIKit
import SwiftKeychainWrapper
import Firebase

class FeedVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func signoutPressed(_ sender: Any) {
        let keychainResult = KeychainWrapper.standard.removeObject(forKey: KEY_UID)
        print("ID Removed from Keychaing \(keychainResult)")
        try! Auth.auth().signOut()
        performSegue(withIdentifier: "goToLogin", sender: nil)
    }

}
