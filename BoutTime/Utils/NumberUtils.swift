//
//  NumberUtils.swift
//  BoutTime
//
//  Created by Mohammed Al-Dahleh on 2017-11-23.
//  Copyright © 2017 Mohammed Al-Dahleh. All rights reserved.
//

class NumberUtils {
    static func format(num: Int) -> String {
        if num == 60 {
            return "1:00"
        } else if num < 60 && num >= 10 {
            return "0:\(num)"
        } else {
            return "0:0\(num)"
        }
    }
}
