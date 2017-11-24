//
//  UIUtils.swift
//  BoutTime
//
//  Created by Mohammed Al-Dahleh on 2017-11-23.
//  Copyright © 2017 Mohammed Al-Dahleh. All rights reserved.
//

import UIKit

class UIUtils {
    static func roundLabelCorners(toRound: [UIButton]) {
        for label in toRound {
            let bounds: CGRect = label.bounds
            let maskPath = UIBezierPath(roundedRect: bounds,
                                        byRoundingCorners: ([.topLeft, .bottomLeft]),
                                        cornerRadii: CGSize(width: 8.0, height: 8.0))
            let maskLayer = CAShapeLayer()
            maskLayer.frame = bounds
            maskLayer.path = maskPath.cgPath
            label.layer.mask = maskLayer
        }
    }
    
    static func set(interaction: Bool, for buttons: [UIButton]) {
        for button in buttons {
            button.isUserInteractionEnabled = interaction
        }
    }
}
