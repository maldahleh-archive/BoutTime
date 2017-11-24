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
    
    @IBOutlet weak var timeLeftLabel: UILabel!
    @IBOutlet weak var solutionButton: UIButton!
    @IBOutlet weak var informationLabel: UILabel!
    
    let gameManager = GameManager()
    let eventManager = EventManager()
    let timer = GameTimer()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIUtils.roundLabelCorners(toRound: [eventLabelOne, eventLabelTwo, eventLabelThree, eventLabelFour])
        newGame()
    }
    
    override func viewDidLayoutSubviews() {
        
    }
    
    // MARK: UI related methods
    func newGame() {
        eventManager.newGame()
        updateUIfor(state: .newRound)
    }

    // MARK: UI Helper methods
    func displayEventsOnLabels() {
        let currentEvents = gameManager.eventsInLabels
        
        eventLabelOne.text = currentEvents[0].eventDescription
        eventLabelTwo.text = currentEvents[1].eventDescription
        eventLabelThree.text = currentEvents[2].eventDescription
        eventLabelFour.text = currentEvents[3].eventDescription
    }
    
    func updateUIfor(state: UIState) {
        switch state {
        case .newRound:
            gameManager.eventsInLabels = eventManager.getEventSetFor(round: gameManager.currentRound).eventSet
            
            timer.runTimerWith(selector: #selector(timerTicked), onObject: self)
            timeLeftLabel.isHidden = false
            
            solutionButton.isHidden = true
            informationLabel.text = "Shake to complete"
            displayEventsOnLabels()
            
        }
    }
    
    func checkAndDisplayAnswer() {
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
            timer.currentSeconds = timer.currentSeconds - 1
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

protocol GameScreen {
    weak var eventLabelOne: UILabel! { get set }
    weak var eventLabelTwo: UILabel! { get set }
    weak var eventLabelThree: UILabel! { get set }
    weak var eventLabelFour: UILabel! { get set }
    
    func displayEventsOnLabels()
}
