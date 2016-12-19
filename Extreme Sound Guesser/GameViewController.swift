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
    var points = 0
    var count = 10
    var round = 1
    var timer = Timer()
    var correctCell = 0
    var highScore = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // sets first sound and plays it
        sound = self.setupAudioPlayerWithFile("Wake Me", type:"mp3")
        sound.play()
        
        // sets up and starts timer using the update method
         timer = Timer.scheduledTimer(timeInterval: 1.5, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
        
        // sets up label
        pointsLabel.text = "Points: \(points)"
    }
    
    //update method called by the timer, changes rounds and ends game once round 11 is reached
    func update() {
        count -= 1
        counterLabel.text = "\(count)"
        
        if count == 0 {
            count = 11
            round += 1
            roundLabel.text = "\(round)/10"
        }
        
        // changes sounds based on which round is called
        if round == 2 && count == 10 {
            changeSound(name: "dogBark", type: "wav")
        }
        if round == 3 && count == 10 {
            // nextsound
            changeSound(name: "manSpeaks", type: "wav")
        }
        if round == 4 && count == 10 {
            // nextsound
            changeSound(name: "Wake Me", type: "mp3")
        }
        if round == 5 && count == 10 {
            // nextsound
            changeSound(name: "dogBark", type: "wav")
        }
        if round == 6 && count == 10 {
            // nextsound
            changeSound(name: "Wake Me", type: "mp3")
        }
        if round == 7 && count == 10 {
            // nextsound
            changeSound(name: "dogBark", type: "wav")
        }
        if round == 8 && count == 10 {
            // nextsound
            changeSound(name: "Wake Me", type: "mp3")
        }
        if round == 9 && count == 10 {
            // nextsound
            changeSound(name: "dogBark", type: "wav")
        }
        if round == 10 && count == 10 {
            // nextsound
            changeSound(name: "Wake Me", type: "mp3")
        }
        
        if round >= 11 {
            timer.invalidate()
            //segue to next view
            if let resultController = self.storyboard?.instantiateViewController(withIdentifier: "EndVC") as? EndGameViewController {
                resultController.score = points
                resultController.highscore = highScore
                self.present(resultController, animated: true, completion: nil)
            }
        }
    }
    
    // changes the sound taking 2 stings as paramiters
    func changeSound(name: String, type: String) {
        sound = AVAudioPlayer()
        sound = self.setupAudioPlayerWithFile(name as NSString, type: type as NSString)
        sound.play()
    }
    
    // sets up the collection view
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if (indexPath.row == correctCell) {
            points += count * 10
            round += 1
            count = 11
            roundLabel.text = "\(round)/10"
            pointsLabel.text = "Points: \(points)"
        } else  if (indexPath.row != correctCell) {
            round += 1
            count = 11
            roundLabel.text = "\(round)/10"
        }
    }
    
    // sets up the cells
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! CollectionViewCellController
        cell.myCellImage.image = UIImage(named: "mcHelmet.jpg")
        return cell
    }

    // allows the user to listen to the sound again
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
