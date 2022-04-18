//
//  ViewController.swift
//  WeatherAppIOS
//
//  Created by Bilge Çakar on 18.04.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var startButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        upadateUI()
    }

    func upadateUI()
    {
        
        startButton.layer.cornerRadius = 20
        startButton.layer.shadowOffset = CGSize(width: 0, height: 1)
        startButton.layer.shadowColor = UIColor.darkGray.cgColor
        startButton.layer.shadowOpacity = 1
        startButton.layer.shadowRadius = 5
        startButton.layer.masksToBounds = false
             
    }

}

