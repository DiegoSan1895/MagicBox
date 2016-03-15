//
//  KeepShowViewController.swift
//  MagicBox
//
//  Created by DiegoSan on 3/15/16.
//  Copyright © 2016 DiegoSan. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit
import MediaPlayer
import IBAnimatable
import SDCycleScrollView
import AVOSCloud

class KeepShowViewController: UIViewController {
    
    let URL = NSBundle.mainBundle().URLForResource("intro_video", withExtension: "mp4")!

    var player: MPMoviePlayerController!
    
    @IBOutlet weak var registerButton: AnimatableButton!
    @IBOutlet weak var loginButton: AnimatableButton!
    @IBOutlet weak var pageControl: UIPageControl!
    
    @IBAction func registerButtonDidPressed(sender: UIButton) {
        
        let registerVC = storyboard?.instantiateViewControllerWithIdentifier("KeepRegisterStep1ViewController") as! KeepRegisterStep1ViewController
        
        navigationController?.pushViewController(registerVC, animated: true)
    }
    
    @IBAction func loginButtonDidPressed(sender: UIButton) {
        
    }
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playLocalVideoWithMPMoviePlayer()
        
        testAVOSCloud()

    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.hidden = true
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    private func playLoaclVideoWithAVPlayer(){
        
        let playerVC = AVPlayerViewController()
        let player = AVPlayer(URL: URL)
        playerVC.player = player
        player.play()
        playerVC.showsPlaybackControls = true
        
        playerVC.view.frame = view.frame
        view.addSubview(playerVC.view)
        addChildViewController(playerVC)
    }
    
    private func playLocalVideoWithMPMoviePlayer(){
        
        player = MPMoviePlayerController(contentURL: URL)
        player.controlStyle = .None
        player.shouldAutoplay = true
        player.repeatMode = .One
        
        player.prepareToPlay()
        player.view.frame = view.bounds
        view.insertSubview(player.view, atIndex: 0)
        player.play()
    }
    
    private func testAVOSCloud(){
        
        let testObject = AVObject(className: "testObject")
        testObject.setObject("hahsdg", forKey: "foo")
        testObject.save()
    }
    
}
