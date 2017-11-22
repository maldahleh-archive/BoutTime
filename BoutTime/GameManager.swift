//
//  GameManager.swift
//  BoutTime
//
//  Created by Mohammed Al-Dahleh on 2017-11-16.
//  Copyright © 2017 Mohammed Al-Dahleh. All rights reserved.
//

import Foundation

protocol MainManager {
    var viewManager: GameScreen { get }
}

protocol Playable {
    var currentRound: Int { get set }
    
    func nextRound()
}

protocol Resetable {
    func newGame()
}

class GameManager: MainManager, Playable, Resetable {
    let viewManager: GameScreen
    var currentRound: Int
    
    init (viewManager: GameScreen) {
        self.viewManager = viewManager
        self.currentRound = 1
    }
    
    func newGame() {
        currentRound = 1
    }
    
    func nextRound() {
        currentRound += 1
    }
}
