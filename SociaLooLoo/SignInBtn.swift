//
//  SignInBtn.swift
//  SociaLooLoo
//
//  Created by John Peppe on 7/13/17.
//  Copyright © 2017 John Peppe. All rights reserved.
//

import UIKit

class SignInBtn: UIButton {
    override func awakeFromNib() {
        super.awakeFromNib()
            layer.shadowColor = UIColor(red: SHADOW_GRAY, green: SHADOW_GRAY, blue: SHADOW_GRAY, alpha: 0.6).cgColor
            layer.shadowOpacity = 0.8
            layer.shadowRadius = 5.0
            layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
            layer.cornerRadius = 5.0
    }
}


