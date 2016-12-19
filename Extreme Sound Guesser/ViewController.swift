//
//  ViewController.swift
//  Extreme Sound Guesser
//
//  Created by Ty Victorson on 12/7/16.
//  Copyright © 2016 Xision. All rights reserved.
//
/*
 Volatile Reaction Kevin MacLeod (incompetech.com)
 Licensed under Creative Commons: By Attribution 3.0 License
 http://creativecommons.org/licenses/by/3.0/
 */

import UIKit
import Darwin
import AVFoundation
import CoreData

class ViewController: UIViewController, AVAudioPlayerDelegate {

    var music = AVAudioPlayer()
    var highScore = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // saves score
        let defaults: UserDefaults = UserDefaults.standard
        let savedScore = defaults.integer(forKey: "highScore")
        highScore = savedScore
        
        music = self.setupAudioPlayerWithFile("VolatileReaction", type: "mp3")
        music.play()
        music.numberOfLoops = -1
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func eyeButton(_ sender: Any) {
        exit(0)
    }
    
    // Sound setup
    func setupAudioPlayerWithFile(_ file:NSString, type:NSString) -> AVAudioPlayer  {
        //1
        let path = Bundle.main.path(forResource: file as String, ofType:type as String)
        let url = URL(fileURLWithPath: path!)
        
        //2
        var audioPlayer:AVAudioPlayer?
        
        // 3
        do {
            try audioPlayer = AVAudioPlayer(contentsOf: url)
        } catch {
            print("Player not available")
        }
        
        //4
        return audioPlayer!
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! GameViewController
        vc.highScore = highScore
    }
    
}

