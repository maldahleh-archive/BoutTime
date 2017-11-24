//
//  UIUtils.swift
//  BoutTime
//
//  Created by Mohammed Al-Dahleh on 2017-11-23.
//  Copyright © 2017 Mohammed Al-Dahleh. All rights reserved.
//

import UIKit

class UIUtils {
    static func set(interaction: Bool, for buttons: [UIButton]) {
        for button in buttons {
            button.isUserInteractionEnabled = interaction
        }
    }
}
