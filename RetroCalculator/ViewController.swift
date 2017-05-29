//
//  ViewController.swift
//  RetroCalculator
//
//  Created by Ricardo Herrera Petit on 5/28/17.
//  Copyright © 2017 Ricardo Herrera Petit. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var outputLbl: UILabel!
    
    var runningNumber = ""
    
    
    var btnSound: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        let path = Bundle.main.path(forResource: "btn", ofType: "wav")
        let soundURL = URL(fileURLWithPath: path!)
        
        do {
           try btnSound = AVAudioPlayer(contentsOf: soundURL)
           btnSound.prepareToPlay()
        }
        catch let err as NSError {
            print(err.debugDescription)
        }
    }
    
    @IBAction func numberPressed(sender:UIButton) {
        playSound()
        
        runningNumber += "\(sender.tag)"
        outputLbl.text = runningNumber 
    }
    
    func playSound() {
        if btnSound.isPlaying {
            btnSound.stop()
        }
        
        btnSound.play()
    }

    



}

