//
//  ViewController.swift
//  LottiAnimations
//
//  Created by Ravi Dwivedi on 13/09/23.
//

import UIKit
import Lottie

class ViewController: UIViewController {
    private var animationView:LottieAnimationView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpAnimationView()
    }
    
    private func setUpAnimationView(){
        animationView = .init(name:"animation_lmhow9zi.json")
        animationView.frame = view.frame
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.animationSpeed = 1.0
        view.addSubview(animationView)
        animationView.play()
    }
}

