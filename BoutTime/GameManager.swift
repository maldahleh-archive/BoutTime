//
//  GameManager.swift
//  BoutTime
//
//  Created by Mohammed Al-Dahleh on 2017-11-16.
//  Copyright © 2017 Mohammed Al-Dahleh. All rights reserved.
//

import Foundation

protocol Manager {
    var viewManager: GameScreen { get }
}

protocol Playable {
    var currentRound: Int { get set }
}

protocol Checkable {
    func isMatched(checkArray: [Event]) -> Bool
}

protocol Resetable {
    func newGame()
}

class GameManager: Manager, Playable, Checkable, Resetable {
    let viewManager: GameScreen
    var currentRound: Int
    
    init (viewManager: GameScreen) {
        self.viewManager = viewManager
        newGame()
    }
    
    func newGame() {
        currentRound = 1
    }
    
    func isMatched(checkArray: [Event]) -> Bool {
        for index in 0...eventArray.count {
            if eventArray[index] != checkArray [index] {
                return false
            }
        }
        
        return true
    }
}
