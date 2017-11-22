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

protocol Resetable {
    func newGame()
}

class GameManager: Playable, Resetable {
    var currentRound: Int = 1
    var eventsInLabels: [Event] = []
    
    func newGame() {
        currentRound = 1
    }
    
    func nextRound() {
        currentRound += 1
    }
}
