//
//  ScoreViewController.swift
//  BoutTime
//
//  Created by Mohammed Al-Dahleh on 2017-11-24.
//  Copyright © 2017 Mohammed Al-Dahleh. All rights reserved.
//

import UIKit

class ScoreViewController: UIViewController {
    @IBOutlet weak var scoreLabel: UILabel!
    
    var userScore: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let score = userScore else {
            fatalError("Unable to find score")
        }

        scoreLabel.text = score
    }
    
    @IBAction func playAgainBtnClicked(_ sender: Any) {
        performSegue(withIdentifier: "toMain", sender: nil)
    }
}
