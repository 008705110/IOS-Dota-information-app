//
//  MainViewController.swift
//  hero
//
//  Created by admin on 12/7/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit
import AVFoundation

class MainViewController: UIViewController {
    
    @IBOutlet weak var tapButton: UIButton!
    var audioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    

        // Do any additional setup after loading the view.
    }
    @IBAction func tapButton(_ sender: Any) {
        print("LNASGHALJGLAHLS")
        let sound = Bundle.main.path(forResource: "dota2", ofType: "mp3")
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
        }catch{
            print("unable to play")
        }
        audioPlayer.play()
    }
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
