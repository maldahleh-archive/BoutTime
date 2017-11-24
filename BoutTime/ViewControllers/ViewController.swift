//
//  ViewController.swift
//  BoutTime
//
//  Created by Mohammed Al-Dahleh on 2017-11-07.
//  Copyright © 2017 Mohammed Al-Dahleh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, Resetable {
    @IBOutlet weak var eventLabelOne: UIButton!
    @IBOutlet weak var eventLabelTwo: UIButton!
    @IBOutlet weak var eventLabelThree: UIButton!
    @IBOutlet weak var eventLabelFour: UIButton!
    
    @IBOutlet var navigationButtons: [UIButton]!
    
    @IBOutlet weak var timeLeftLabel: UILabel!
    @IBOutlet weak var solutionButton: UIButton!
    @IBOutlet weak var informationLabel: UILabel!
    
    let gameManager = GameManager()
    let eventManager = EventManager()
    let timer = GameTimer()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // UIUtils.roundLabelCorners(toRound: [eventLabelOne, eventLabelTwo, eventLabelThree, eventLabelFour])
        newGame()
    }
    
    // MARK: UI related methods
    func newGame() {
        gameManager.newGame()
        eventManager.newGame()
        
        UIUtils.set(interaction: false, for: [eventLabelOne, eventLabelTwo, eventLabelThree, eventLabelFour])
        UIUtils.set(interaction: true, for: navigationButtons)
        newRound()
    }
    
    func newRound() {
        gameManager.isRoundActive = true
        gameManager.eventsInLabels = eventManager.getEventSetFor(round: gameManager.currentRound).eventSet
        
        timer.runTimerWith(selector: #selector(timerTicked), onObject: self)
        timeLeftLabel.isHidden = false
        
        solutionButton.isHidden = true
        informationLabel.text = "Shake to complete"
        displayEventsOnLabels()
    }

    // MARK: UI Helper methods
    func displayEventsOnLabels() {
        let currentEvents = gameManager.eventsInLabels
        
        eventLabelOne.setTitle(currentEvents[0].eventDescription, for: .normal)
        eventLabelTwo.setTitle(currentEvents[1].eventDescription, for: .normal)
        eventLabelThree.setTitle(currentEvents[2].eventDescription, for: .normal)
        eventLabelFour.setTitle(currentEvents[3].eventDescription, for: .normal)
    }
    
    func checkAndDisplayAnswer() {
        UIUtils.set(interaction: true, for: [eventLabelOne, eventLabelTwo, eventLabelThree, eventLabelFour])
        UIUtils.set(interaction: false, for: navigationButtons)
        gameManager.isRoundActive = false
        
        timer.cancelTimer()
        timeLeftLabel.isHidden = true
        
        solutionButton.isHidden = false
        informationLabel.text = "Tap events to learn more"
        
        if eventManager.doesMatchFor(array: gameManager.eventsInLabels, round: gameManager.currentRound) {
            solutionButton.setImage(UIImage(named: "next_round_success"), for: .normal)
            gameManager.logRound(won: true)
        } else {
            solutionButton.setImage(UIImage(named: "next_round_fail"), for: .normal)
            gameManager.logRound(won: false)
        }
    }
    
    // MARK: Timer methods
    @objc func timerTicked() {
        if timer.currentSeconds > -1 {
            timeLeftLabel.text = NumberUtils.clean(num: timer.currentSeconds)
            timer.currentSeconds -= 1
        } else {
            checkAndDisplayAnswer()
        }
    }
    
    // MARK: Event movement action methods
    @IBAction func upBtnClicked(_ sender: UIButton) {
        gameManager.updateEventUpFromPosition(sender.tag)
        displayEventsOnLabels()
    }
    
    @IBAction func downBtnClicked(_ sender: UIButton) {
        gameManager.updateEventDownFromPosition(sender.tag)
        displayEventsOnLabels()
    }
    
    // MARK: Shake functions
    override func becomeFirstResponder() -> Bool {
        return true
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if motion == .motionShake && gameManager.isRoundActive {
            checkAndDisplayAnswer()
        }
    }
}
