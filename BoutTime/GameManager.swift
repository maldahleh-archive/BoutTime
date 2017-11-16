//
//  GameManager.swift
//  BoutTime
//
//  Created by Mohammed Al-Dahleh on 2017-11-16.
//  Copyright © 2017 Mohammed Al-Dahleh. All rights reserved.
//

import Foundation

protocol Manager {
    var gameManager: GameScreen { get }
}

class GameManager: Manager {
    let gameManager: GameScreen
    
    init (gameManager: GameScreen) {
        self.gameManager = gameManager
    }
    
    
}
