//
//  ViewController.swift
//  BoutTime
//
//  Created by Mohammed Al-Dahleh on 2017-11-07.
//  Copyright © 2017 Mohammed Al-Dahleh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, GameScreen, Resetable {
    @IBOutlet weak var eventLabelOne: UILabel!
    @IBOutlet weak var eventLabelTwo: UILabel!
    @IBOutlet weak var eventLabelThree: UILabel!
    @IBOutlet weak var eventLabelFour: UILabel!
    
    let gameManager = GameManager()
    let eventManager = EventManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareUI()
        newGame()
    }
    
    // MARK: UI related methods
    func prepareUI() {
        roundLabelCorners()
    }
    
    func newGame() {
        eventManager.newGame()
        gameManager.eventsInLabels = eventManager.getEventSetFor(round: gameManager.currentRound).eventSet
        
        displayEventsOnLabels()
    }

    // MARK: UI Helper methods
    func roundLabelCorners() {
        eventLabelOne.layer.masksToBounds = true
        eventLabelOne.layer.cornerRadius = 8.0
        
        eventLabelTwo.layer.masksToBounds = true
        eventLabelTwo.layer.cornerRadius = 8.0
        
        eventLabelThree.layer.masksToBounds = true
        eventLabelThree.layer.cornerRadius = 8.0
        
        eventLabelFour.layer.masksToBounds = true
        eventLabelFour.layer.cornerRadius = 8.0
    }
    
    func displayEventsOnLabels() {
        let currentEvents = eventManager.getEventSetFor(round: gameManager.currentRound).eventSet
        
        eventLabelOne.text = currentEvents[0].eventDescription
        eventLabelTwo.text = currentEvents[1].eventDescription
        eventLabelThree.text = currentEvents[2].eventDescription
        eventLabelFour.text = currentEvents[3].eventDescription
    }
    
    // MARK: Shake functions
    override func becomeFirstResponder() -> Bool {
        return true
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            // FIXME: Handle shaking
        }
    }
}

protocol GameScreen {
    weak var eventLabelOne: UILabel! { get set }
    weak var eventLabelTwo: UILabel! { get set }
    weak var eventLabelThree: UILabel! { get set }
    weak var eventLabelFour: UILabel! { get set }
    
    func displayEventsOnLabels()
}
