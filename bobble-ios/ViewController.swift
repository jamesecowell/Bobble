//
//  ViewController.swift
//  bobble-ios
//
//  Created by James Cowell on 24/05/2020.
//  Copyright © 2020 James Cowell. All rights reserved.
//

import UIKit
import AVKit

class ViewController: UIViewController {
    
    var videoPlayer:AVPlayer?
    
    var videoPlayerLayer:AVPlayerLayer?

    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        // Set up video in the background
        setUpVideo()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    func setUpVideo() {
        // Get the path to the resource in the bundle
        let bundlePath = Bundle.main.path(forResource: "bgvid", ofType: "mp4")
        
        guard bundlePath != nil else {
            return
        }
        // Create URL
        let url = URL(fileURLWithPath: bundlePath!)
        // Create video player item
        let item = AVPlayerItem(url: url)
        // Create player
        videoPlayer = AVPlayer(playerItem: item)
        // Create layer
        videoPlayerLayer = AVPlayerLayer(player: videoPlayer!)
        // Adjust size and frame
        videoPlayerLayer?.frame = CGRect(x:
            -self.view.frame.size.width*1.5, y: 0, width:
            self.view.frame.size.width*4, height:
            self.view.frame.size.height*1.15)
        
        view.layer.insertSublayer(videoPlayerLayer!, at: 0)
        // Add to view and play
        videoPlayer?.playImmediately(atRate: 0.75)
    }
    
}

