//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {
    
    var player: AVAudioPlayer!
 
    @IBOutlet var progressPar: UIProgressView!
    @IBOutlet var titleLabel: UILabel!
    let eggTime=["Soft":300,"Medium":480,"Hard":720]
    var secondsRemainig=60
    var timer = Timer()
    var i = 0

    @IBAction func hardenessSelected(_ sender: UIButton) {
        
        titleLabel.text="How do you like your eggs?"
        timer.invalidate()
        i = 0
        progressPar.progress=0
        let hardness=sender.currentTitle!
        secondsRemainig=eggTime[hardness]!
        timer=Timer.scheduledTimer(timeInterval: 1.0, target:self,selector:#selector(updateTimer),userInfo:nil,repeats: true)
    }
    
    @objc func updateTimer(){
        
        switch secondsRemainig {
        case 0:
             i = 0
            timer.invalidate()
            titleLabel.text="DONE"
            playSound()

        case _ where secondsRemainig > 0:
           i += 1
            print("\(secondsRemainig)seconds.")
            secondsRemainig -= 1
            let bb: Float=Float(secondsRemainig+i)
            let parTimer: Float=1/bb;
            progressPar.progress +=  parTimer
           
        default:
            print("ERROR")
        }
        
    
        
    }
    func playSound() {
          let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
          player = try! AVAudioPlayer(contentsOf: url!)
          player.play()
                  
      }

}
