//
//  ViewController.swift
//  BoutTime
//
//  Created by Mohammed Al-Dahleh on 2017-11-07.
//  Copyright © 2017 Mohammed Al-Dahleh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, GameScreen {
    @IBOutlet weak var eventLabelOne: UILabel!
    @IBOutlet weak var eventLabelTwo: UILabel!
    @IBOutlet weak var eventLabelThree: UILabel!
    @IBOutlet weak var eventLabelFour: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareUI()
    }
    
    // MARK: UI related methods
    func prepareUI() {
        roundLabelCorners()
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
}

protocol GameScreen {
    
}
