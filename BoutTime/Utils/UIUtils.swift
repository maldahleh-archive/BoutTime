//
//  UIUtils.swift
//  BoutTime
//
//  Created by Mohammed Al-Dahleh on 2017-11-23.
//  Copyright © 2017 Mohammed Al-Dahleh. All rights reserved.
//

import UIKit

class UIUtils {
    static func roundLabelCorners(toRound: [UILabel]) {
        for label in toRound {
            label.layer.masksToBounds = true
            label.layer.cornerRadius = 8.0
        }
    }
}
