//
//  ViewController.swift
//  GeekWhat2Do
//
//  Created by gkin on 2023/07/23.
//

import UIKit

import AVFoundation


class ViewWithAnimationViewController: UIViewController {
    
    let backGroundGIFView = UIView()
    
    
    let contentView = UIView()


    let viewWithAlpha = UIView()
    
    
    let nameLabel = UILabel()


    let nameTextField = UITextField()


    let emailLabel = UILabel()


    let emailTextField = UITextField()


    let pwdLabel = UILabel()


    let pwdTextField = UITextField()


    let signUpButton = UIButton()
    
    
    let forgotPwd = UIButton()
    

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        view.addSubview(backGroundGIFView)
        backGroundGIFView.frame = view.frame
        
        
        playVideo()
    }
    
    
    func playVideo() {
        
        guard let path = Bundle.main.path(forResource: "backvid", ofType: "mp4") else {
            print("Error: Video file not found")
            return
        }
        
        
        let player = AVPlayer (url: URL(fileURLWithPath: path))
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = self.view.bounds
        playerLayer.videoGravity = .resizeAspectFill

        self.backGroundGIFView.layer.addSublayer(playerLayer)
        
        player.play()
    }
}
