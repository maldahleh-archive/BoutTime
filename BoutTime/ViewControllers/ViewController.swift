//
//  ViewController.swift
//  BoutTime
//
//  Created by Mohammed Al-Dahleh on 2017-11-07.
//  Copyright © 2017 Mohammed Al-Dahleh. All rights reserved.
//

import UIKit

// FIXME: Some URLs crash, rounding corners

class ViewController: UIViewController {    
    @IBOutlet var eventButtons: [UIButton]!
    @IBOutlet var navigationButtons: [UIButton]!
    
    @IBOutlet weak var timeLeftLabel: UILabel!
    @IBOutlet weak var solutionButton: UIButton!
    @IBOutlet weak var informationLabel: UILabel!
    
    let audioManager = AudioManager()
    let gameManager = GameManager()
    let eventManager = EventManager()
    let timer = GameTimer()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameManager.newGame()
        eventManager.newGame()
        
        newRound()
    }
    
    // MARK: UI related methods
    func newRound() {
        UIUtils.set(interaction: false, for: eventButtons)
        UIUtils.set(interaction: true, for: navigationButtons)
        
        gameManager.isRoundActive = true
        gameManager.eventsInLabels = eventManager.getEventSetFor(round: gameManager.currentRound).eventSet
        
        timer.runTimerWith(selector: #selector(timerTicked), onObject: self)
        timeLeftLabel.isHidden = false
        timeLeftLabel.text = "1:00"
        
        solutionButton.isHidden = true
        informationLabel.text = "Shake to complete"
        displayEventsOnLabels()
    }
    
    func displayEventsOnLabels() {
        let currentEvents = gameManager.eventsInLabels
        
        for button in eventButtons {
            button.setTitle(currentEvents[button.tag].eventDescription, for: .normal)
        }
    }
    
    // MARK: Game related methods
    func checkAndDisplayAnswer() {
        UIUtils.set(interaction: true, for: eventButtons)
        UIUtils.set(interaction: false, for: navigationButtons)
        gameManager.isRoundActive = false
        
        timer.cancelTimer()
        timeLeftLabel.isHidden = true
        
        solutionButton.isHidden = false
        informationLabel.text = "Tap events to learn more"
        
        if eventManager.doesMatchFor(array: gameManager.eventsInLabels, round: gameManager.currentRound) {
            audioManager.playRightAnswerSound()
            solutionButton.setImage(UIImage(named: "next_round_success"), for: .normal)
            gameManager.logRound(won: true)
        } else {
            audioManager.playWrongAnswerSound()
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
    
    // MARK: Segue methods to transition to other view controllers
    @IBAction func nextRoundClicked(_ sender: Any) {
        if gameManager.currentRound == 6 {
            performSegue(withIdentifier: "toScore", sender: nil)
            return
        }
        
        gameManager.currentRound += 1
        newRound()
    }
    
    @IBAction func eventBtnClicked(_ sender: UIButton) {
        performSegue(withIdentifier: "toWebView", sender: sender.tag)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            switch identifier {
            case "toWebView":
                guard let eventIndex = sender as? Int else {
                    return
                }
                
                guard let destinationVC = segue.destination as? WebViewController else {
                    return
                }
                
                destinationVC.webURL = gameManager.eventsInLabels[eventIndex].eventURL
                break
            case "toScore":
                guard let destinationVC = segue.destination as? ScoreViewController else {
                    return
                }
                
                destinationVC.userScore = gameManager.getScore()
                break
            default: return
            }
        }
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
