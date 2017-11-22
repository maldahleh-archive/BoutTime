//
//  GameManager.swift
//  BoutTime
//
//  Created by Mohammed Al-Dahleh on 2017-11-16.
//  Copyright © 2017 Mohammed Al-Dahleh. All rights reserved.
//

import Foundation

protocol MainManager {
    var eventManager: EventManager { get }
    var viewManager: GameScreen { get }
}

protocol Playable {
    var currentRound: Int { get set }
    
    func nextRound()
}

protocol Checkable {
    func isMatched(checkArray: [Event]) -> Bool
}

protocol Resetable {
    func newGame()
}

class GameManager: MainManager, Playable, Checkable, Resetable {
    let eventManager: EventManager
    let viewManager: GameScreen
    var currentRound: Int
    
    init (eventManager: EventManager, viewManager: GameScreen) {
        self.eventManager = eventManager
        self.viewManager = viewManager
        self.currentRound = 1
    }
    
    func newGame() {
        currentRound = 1
    }
    
    func nextRound() {
        currentRound += 1
    }
    
    func isMatched(checkArray: [Event]) -> Bool {
        let eventArray = eventManager.getEventSetFor(round: currentRound).eventSet
        
        for index in 0...eventArray.count {
            if eventArray[index] != checkArray [index] {
                return false
            }
        }
        
        return true
    }
}
