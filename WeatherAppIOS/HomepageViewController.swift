//
//  HomepageViewController.swift
//  WeatherAppIOS
//
//  Created by Bilge Çakar on 18.04.2022.
//

import UIKit

class HomepageViewController: UIViewController
{
    

    @IBOutlet weak var degreeView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        updateUI()
    }
    
    func updateUI()
    {
        
        
        degreeView.layer.cornerRadius = degreeView.layer.frame.size.width / 2
        degreeView.clipsToBounds = true
        degreeView.layer.shadowOffset = CGSize(width: 0, height: 1)
        degreeView.layer.shadowColor = UIColor.purple.cgColor
        degreeView.layer.shadowOpacity = 0.4
        degreeView.layer.shadowRadius = 20
        degreeView.layer.masksToBounds = false
       
        
        
    }

}
