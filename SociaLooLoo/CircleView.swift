//
//  CircleView.swift
//  SociaLooLoo
//
//  Created by John Peppe on 7/15/17.
//  Copyright © 2017 John Peppe. All rights reserved.
//

import UIKit

class CircleView: UIImageView {
    
    override func layoutSubviews() {
        layer.cornerRadius = self.frame.width / 2
        clipsToBounds = true
    }

}
