//
//  ErrorViewController.swift
//  WeatherAppIOS
//
//  Created by Bilge Çakar on 26.04.2022.
//

import UIKit
import Lottie

class ErrorViewController: UIViewController {
    
    @IBOutlet weak var cloudAnimation: AnimationView!
    @IBOutlet weak var tryAgainButton: UIButton!
    @IBOutlet weak var backgroundView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        updatUI()
        
    }
    
    func updatUI()
    {
        tryAgainButton.layer.cornerRadius = 10
        tryAgainButton.layer.masksToBounds = false
        
        backgroundView.layer.cornerRadius = 20
        backgroundView.layer.masksToBounds = false
        
        cloudAnimation.loopMode = .loop
        cloudAnimation.play()
    }
    
    @IBAction func tryAgain(_ sender: Any) {
        dismiss(animated: true)
    }
}
