//
//  HomepageViewController.swift
//  WeatherAppIOS
//
//  Created by Bilge Çakar on 18.04.2022.
//

import UIKit

class HomepageViewController: UIViewController
{
    
    
    @IBOutlet weak var backgroundImage: UIImageView!
    
    @IBOutlet weak var cloudLabel: UILabel!
    @IBOutlet weak var windyLabel: UILabel!
    @IBOutlet weak var sunsetLabel: UILabel!
    @IBOutlet weak var dateLabel: UIImageView!
    @IBOutlet weak var weatherTempLabel: UILabel!
    @IBOutlet weak var weatherDesc: UILabel!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var search: UITextField!
    var weatherList = [Weather]()
    
    
    var homePresenterObject : ViewToPresenterHomepageProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       updateUI()
        search.delegate = self
        HomepageRouter.createModule(ref: self)
      
        
    }
    
    func updateUI()
    {
        backgroundImage.layer.masksToBounds = true
        backgroundImage.layer.cornerRadius = 60
        backgroundImage.layer.maskedCorners = [.layerMinXMaxYCorner]
        backgroundImage.clipsToBounds = true
    }
    
 
    
    override func viewWillAppear(_ animated: Bool) {
        homePresenterObject?.getCurrentWeather()
       
    }
    
    
    @IBAction func searcPressed(_ sender: Any){
        search.endEditing(true)
        print(search.text!)
    }
    
}
extension HomepageViewController : PresenterToViewHomepageProtocol
{
    func sendToDataView(weatherInfo : Array<Weather>) {
        self.weatherList = weatherInfo
     
        DispatchQueue.main.async {
            self.cityNameLabel.text = self.weatherList[0].city_name!
            self.weatherTempLabel.text = "\(self.weatherList[0].temp!)°"
            self.weatherDesc.text = "It's \(self.weatherList[0].weather?.description ?? "")"
            self.sunsetLabel.text = self.weatherList[0].sunrise!
            self.windyLabel.text = "\(self.weatherList[0].wind_spd!) m/s"
            self.cloudLabel.text = "\(self.weatherList[0].clouds!) %"
            
        }
    }
    
}


extension HomepageViewController : UITextFieldDelegate
{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        search.endEditing(true)
        print(search.text!)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if search.text != ""
        {
            return true
        }
        else
        {
            search.placeholder = "Enter the city name"
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        search.text = ""
    }
}
