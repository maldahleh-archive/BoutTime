//
//  Timer.swift
//  BoutTime
//
//  Created by Mohammed Al-Dahleh on 2017-11-23.
//  Copyright © 2017 Mohammed Al-Dahleh. All rights reserved.
//

import Foundation

protocol Counter {
    var interval: Double { get }
    
    var timer: Timer! { get set }
    var timerActive: Bool { get set }
    
    var currentSeconds: Int { get set }
    var totalSeconds: Int { get }
    
    func runTimerWithCompletion(selector: Selector)
    func cancelTimer()
}

class GameTimer: Counter {
    let interval: Double = 1
    
    var timer: Timer!
    var timerActive: Bool = false
    
    var currentSeconds: Int = 60
    let totalSeconds: Int = 60
    
    func runTimerWithCompletion(selector: Selector) {
        if !timerActive {
            timer = Timer.scheduledTimer(timeInterval: interval, target: self, selector: selector, userInfo: nil, repeats: true)
            timerActive = true
        }
    }
    
    func cancelTimer() {
        currentSeconds = totalSeconds
        
        timer.invalidate()
        timerActive = false
    }
}
