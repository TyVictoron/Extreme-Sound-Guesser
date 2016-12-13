//
//  GameViewController.swift
//  Extreme Sound Guesser
//
//  Created by Ty Victorson on 12/9/16.
//  Copyright © 2016 Xision. All rights reserved.
//

import UIKit
import AVFoundation

class GameViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, AVAudioPlayerDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var pointsLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    var sound = AVAudioPlayer()
    var count = 10
    var round = 1
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sound = self.setupAudioPlayerWithFile("grenadeLauncher", type:"mp3")
        sound.play()
        
         timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
    }
    
    func update() {
        count -= 1
        counterLabel.text = "\(count)"
        
        if count == 0 {
            count = 11
            round += 1
            roundLabel.text = "\(round)/10"
        }
        
        if round == 2 && count == 11 {
            changeSound(name: "dogBark", type: "wav")
        }
        if round == 3 && count == 11 {
            // nextsound
        }
        if round == 4 && count == 11 {
            // nextsound
        }
        if round == 5 && count == 11 {
            // nextsound
        }
        if round == 6 && count == 11 {
            // nextsound
        }
        if round == 7 && count == 11 {
            // nextsound
        }
        if round == 8 && count == 11 {
            // nextsound
        }
        if round == 9 && count == 11 {
            // nextsound
        }
        if round == 10 && count == 11 {
            // nextsound
        }
        
        if round == 11 {
            timer.invalidate()
            //segue to next view
            if let resultController = self.storyboard?.instantiateViewController(withIdentifier: "EndVC") as? EndGameViewController {
                self.present(resultController, animated: true, completion: nil)
                //self.performSegueWithIdentifier("StartVC", sender: nil)
            }
        }
    }
    
    func changeSound(name: String, type: String) {
        sound = AVAudioPlayer()
        sound = self.setupAudioPlayerWithFile(name as NSString, type: type as NSString)
        sound.play()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! CollectionViewCellController
        
        return cell
    }

    @IBAction func playAgainButton(_ sender: Any) {
        sound.play()
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
}
