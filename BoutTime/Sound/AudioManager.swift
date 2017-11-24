//
//  AudioManager.swift
//  BoutTime
//
//  Created by Mohammed Al-Dahleh on 2017-11-23.
//  Copyright © 2017 Mohammed Al-Dahleh. All rights reserved.
//

import AudioToolbox

class AudioManager {
    // References to the sounds used
    var rightAnswerSound: SystemSoundID = 0
    var wrongAnswerSound: SystemSoundID = 1
    
    // Initalize the manager by loading the sounds
    init () {
        loadSounds()
    }
    
    // Load all the needed sounds
    func loadSounds() {
        var pathToSoundFile = Bundle.main.path(forResource: "CorrectDing", ofType: "wav")
        var soundURL = URL(fileURLWithPath: pathToSoundFile!)
        AudioServicesCreateSystemSoundID(soundURL as CFURL, &rightAnswerSound)
        
        pathToSoundFile = Bundle.main.path(forResource: "IncorrectBuzz", ofType: "wav")
        soundURL = URL(fileURLWithPath: pathToSoundFile!)
        AudioServicesCreateSystemSoundID(soundURL as CFURL, &wrongAnswerSound)
    }
    
    // MARK: Methods to play sounds
    func playRightAnswerSound() {
        AudioServicesPlaySystemSound(rightAnswerSound)
    }
    
    func playWrongAnswerSound() {
        AudioServicesPlaySystemSound(wrongAnswerSound)
    }
}
