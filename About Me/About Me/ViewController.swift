//
//  ViewController.swift
//  About Me
//
//  Created by Mengfan Wang on 8/5/20.
//  Copyright © 2020 Mengfan Wang. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {

    @IBOutlet var button: UIButton!
    
    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func didTapButton(){
        if let player = player, player.isPlaying{
            //stop playback
            player.stop()
        }
        else{
            //set up player, and play
            let urlString = Bundle.main.path(forResource: "Lauv", ofType: "mp3")
            do{
                try AVAudioSession.sharedInstance().setMode(.default)
                try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
                
                guard let urlString = urlString else{
                    return
                }
                player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: urlString))
                
                guard let player = player else{
                    return
                }
                player.play()
            }
            catch{
                print("something went wrong")
            }
        }
    }

}

