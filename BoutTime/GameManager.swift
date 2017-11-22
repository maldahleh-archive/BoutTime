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
    func updateEventUpFromPosition(_ originalPosition: Int)
    func updateEventDownFromPosition(_ originalPosition: Int)
}

protocol Resetable {
    func newGame()
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
    func updateEventUpFromPosition(_ originalPosition: Int) {
        let newPosition = originalPosition - 1
        
        let movedUp = eventsInLabels[originalPosition]
        let movedDown = eventsInLabels[newPosition]
        
        eventsInLabels[originalPosition] = movedDown
        eventsInLabels[newPosition] = movedUp
    }
    
    func updateEventDownFromPosition(_ originalPosition: Int) {
        let newPosition = originalPosition + 1
        
        let movedDown = eventsInLabels[originalPosition]
        let movedUp = eventsInLabels[newPosition]
        
        eventsInLabels[originalPosition] = movedUp
        eventsInLabels[newPosition] = movedDown
    }
}
