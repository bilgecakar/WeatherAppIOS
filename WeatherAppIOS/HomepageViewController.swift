//
//  HomepageViewController.swift
//  WeatherAppIOS
//
//  Created by Bilge Çakar on 18.04.2022.
//

import UIKit

class HomepageViewController: UIViewController
{
    

  
    @IBOutlet weak var redCircle: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        updateUI()
    }
    
    func updateUI()
    {
    
        redCircle.layer.cornerRadius = redCircle.layer.frame.size.width / 2
        redCircle.clipsToBounds = true
        
    }

}
