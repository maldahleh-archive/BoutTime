//
//  GameManager.swift
//  BoutTime
//
//  Created by Mohammed Al-Dahleh on 2017-11-16.
//  Copyright © 2017 Mohammed Al-Dahleh. All rights reserved.
//

protocol Playable {
    var currentRound: Int { get set }
    var eventsInLabels: [Event] { get set }
    
    func nextRound()
}

protocol Updater {
    func updateEventLocationFrom(original: Int, to: Int, withDirection direction: Direction)
    func updateEventUpFrom(original: Int, to: Int)
    func updateEventDownFrom(original: Int, to: Int)
}

protocol Resetable {
    func newGame()
}

enum Direction {
    case up
    case down
}

class GameManager: Playable, Updater, Resetable {
    var currentRound: Int = 1
    var eventsInLabels: [Event] = []
    
    func newGame() {
        currentRound = 1
        eventsInLabels = []
    }
    
    func nextRound() {
        currentRound += 1
    }
    
    // MARK: Functions related to the movement of labels
    func updateEventLocationFrom(original: Int, to: Int, withDirection direction: Direction) {
        
    }
    
    func updateEventUpFrom(original: Int, to: Int) {
        
    }
    
    func updateEventDownFrom(original: Int, to: Int) {
        
    }
}
