//
//  EndGameViewController.swift
//  Extreme Sound Guesser
//
//  Created by Ty Victorson on 12/9/16.
//  Copyright © 2016 Xision. All rights reserved.
//

import UIKit
import CoreData

class EndGameViewController: UIViewController {
    
    @IBOutlet weak var pointsLabel: UILabel!
    @IBOutlet weak var highscoreLabel: UILabel!

    var score = 0
    var highscore = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //**********************************************\\
        // SUBSCRIBE TO REALUFOSIGHTINGS ON YOUTUBE.COM \\
        //**********************************************\\
        
        if (score > highscore) {
            highscore = score
        }
        
        // prints out scores
        pointsLabel.text = "Points: \(score)"
        highscoreLabel.text = "High Score: \(highscore)"
        
        // saves high score and other booleans
        let defaults: UserDefaults = UserDefaults.standard
        defaults.set(highscore, forKey: "highScore")
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! GameViewController
        vc.highScore = highscore
    }

}
