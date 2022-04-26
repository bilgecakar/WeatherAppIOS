//
//  ViewController.swift
//  WeatherAppIOS
//
//  Created by Bilge Çakar on 18.04.2022.
//

import UIKit
import Lottie

class ViewController: UIViewController {

    @IBOutlet weak var launchAnimated: AnimationView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        animate()
        
    }
    
    
    func animate()
    {
        launchAnimated.play{ (finished) in
            self.performSegue(withIdentifier: "toHomepage", sender: nil)
        }
       
        
    }



}

