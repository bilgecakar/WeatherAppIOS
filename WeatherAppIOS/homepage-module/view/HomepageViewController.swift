//
//  HomepageViewController.swift
//  WeatherAppIOS
//
//  Created by Bilge Çakar on 18.04.2022.
//

import UIKit
import ViewAnimator
import Lottie

class HomepageViewController: UIViewController
{
    
    @IBOutlet weak var pulse: AnimationView!
    @IBOutlet weak var searchButonUI: UIButton!
    @IBOutlet weak var weatherIconIamge: UIImageView!
    @IBOutlet weak var weatherCollectionView: UICollectionView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var shadowThreeView: UIView!
    @IBOutlet weak var shadowTwoView: UIView!
    @IBOutlet weak var shadowOneView: UIView!
    @IBOutlet weak var hourlyWeather: UIView!
    @IBOutlet weak var cloudLabel: UILabel!
    @IBOutlet weak var windyLabel: UILabel!
    @IBOutlet weak var sunsetLabel: UILabel!
    @IBOutlet weak var weatherTempLabel: UILabel!
    @IBOutlet weak var weatherDesc: UILabel!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var search: UITextField!
    var weatherList = [Weather]()
    var weatherTime : String =  ""
    var weatherForecast = [WeatherForecast]()
    var cities = [String]()
   
    
    var homePresenterObject : ViewToPresenterHomepageProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        search.delegate = self
        weatherCollectionView.delegate = self
        weatherCollectionView.dataSource = self
        HomepageRouter.createModule(ref: self)
        pulse.play()
                
    }
    
    func updateUI()
    {
        hourlyWeather.layer.masksToBounds = false
        hourlyWeather.layer.cornerRadius = 50
        hourlyWeather.clipsToBounds = true
        
        shadowOneView.layer.masksToBounds = false
        shadowOneView.layer.cornerRadius = 45
        shadowOneView.clipsToBounds = true
        
        shadowTwoView.layer.masksToBounds = false
        shadowTwoView.layer.cornerRadius = 40
        shadowTwoView.clipsToBounds = true
        
        
        shadowThreeView.layer.masksToBounds = false
        shadowThreeView.layer.cornerRadius = 35
        shadowThreeView.clipsToBounds = true
        
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: search.frame.height - 1, width: search.frame.width, height: 1.0)
        bottomLine.backgroundColor = UIColor.white.cgColor
        search.borderStyle = UITextField.BorderStyle.none
        search.layer.addSublayer(bottomLine)
        search.attributedPlaceholder = NSAttributedString(
            string: "City Name",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGray3]
        )
        
        let collectionDesign = UICollectionViewFlowLayout()
        collectionDesign.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        collectionDesign.minimumInteritemSpacing = 5
        collectionDesign.minimumLineSpacing = 5
        let width = self.weatherCollectionView.frame.size.width
        let cellWidth = (width-20) / 3
        collectionDesign.itemSize = CGSize(width: cellWidth, height: cellWidth*1.5)
        weatherCollectionView.collectionViewLayout = collectionDesign
        parseCSV()
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        //Deafult Oshawa/Canada
        homePresenterObject?.sevenDayWeather(cityName: "Ottawa")
        homePresenterObject?.getCurrentWeather(cityName : "Ottawa")
    
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        
        
        UIView.animate(withDuration: 0.3, animations:  {
            
            
            self.shadowThreeView.transform = CGAffineTransform(translationX: 0, y: -30)
            
        }, completion: nil)
        UIView.animate(withDuration: 0.8, animations:  {
            
            self.shadowTwoView.transform = CGAffineTransform(translationX: 0, y: -30)
            
        }, completion: nil)
        UIView.animate(withDuration: 1.3, animations:  {
            
            
            
            self.shadowOneView.transform = CGAffineTransform(translationX: 0, y: -30)
            
        }, completion: nil)
        UIView.animate(withDuration: 1.8, animations:  {
            
            
            self.hourlyWeather.transform = CGAffineTransform(translationX: 0, y: -30)
            
        }, completion: nil)
        
        
    }
    
    @IBAction func searcPressed(_ sender: Any){
       
       
        
        if search.text == "" || search.text!.count < 4  || search.text!.count > 30 || cities.contains(search.text!) == false

        {
            performSegue(withIdentifier: "toError", sender: nil)
            search.text = ""
            
            return
        }else
        {
            
            pulse.play()
            if let cityName =  search.text
            {
                
                homePresenterObject?.getCurrentWeather(cityName : cityName)
                homePresenterObject?.sevenDayWeather(cityName: cityName)
            }
        }
        
        
        search.endEditing(true)
    }
    

    func animate()
    {
        let animation = AnimationType.zoom(scale: 0.5)
        UIView.animate(views : weatherCollectionView.visibleCells, animations: [animation])
        
    }
    
    func openCSV(fileName:String, fileType: String)-> String!{
       guard let filepath = Bundle.main.path(forResource: fileName, ofType: fileType)
           else {
               return nil
       }
       do {
           let contents = try String(contentsOfFile: filepath, encoding: .utf8)

           return contents
       } catch {
           print("File Read Error for file \(filepath)")
           return nil
       }
   }
    
    func parseCSV(){

        let dataString: String! = openCSV(fileName: "cities_full", fileType: "csv")
        var items: [(String, String, String)] = []
        let lines: [String] = dataString.components(separatedBy: NSCharacterSet.newlines) as [String]

        for line in lines {
           var values: [String] = []
           if line != "" {
               if line.range(of: "\"") != nil {
                   var textToScan:String = line
                   var value:String?
                   var textScanner:Scanner = Scanner(string: textToScan)
                while !textScanner.isAtEnd {
                       if (textScanner.string as NSString).substring(to: 1) == "\"" {


                           textScanner.currentIndex = textScanner.string.index(after: textScanner.currentIndex)

                           value = textScanner.scanUpToString("\"")
                           textScanner.currentIndex = textScanner.string.index(after: textScanner.currentIndex)
                       } else {
                           value = textScanner.scanUpToString(",")
                       }

                        values.append(value ?? ""  as String)

                    if !textScanner.isAtEnd{
                            let indexPlusOne = textScanner.string.index(after: textScanner.currentIndex)

                        textToScan = String(textScanner.string[indexPlusOne...])
                        } else {
                            textToScan = ""
                        }
                        textScanner = Scanner(string: textToScan)
                   }

                   // For a line without double quotes, we can simply separate the string
                   // by using the delimiter (e.g. comma)
               } else  {
                   values = line.components(separatedBy: ",")
               }

               // Put the values into the tuple and add it to the items array
               let item = (values[0], values[1], values[2])
               items.append(item)
              
               cities.append(item.1)
               
            }
        }

    }
    
    
    
}
extension HomepageViewController : PresenterToViewHomepageProtocol
{
    func sendToDataView(weatherInfo : Array<Weather>) {
        self.weatherList = weatherInfo
        let date = Date()
        let dateFormatter = DateFormatter()
        
        DispatchQueue.main.async {
            
            let timezone = self.weatherList[0].timezone!
            dateFormatter.timeZone = TimeZone(identifier: timezone)
            dateFormatter.dateFormat = "MMM d, EEE, hh:mm a"
            dateFormatter.locale = Locale(identifier: "en")
            self.weatherTime = dateFormatter.string(from: date)
            print(timezone)
            
            dateFormatter.dateFormat = "hh"
            
            let stringHour = dateFormatter.string(from: date)
            
            let hour = Int(stringHour)!
            
            switch hour {
            case 5...18:
                self.backgroundImage.image = UIImage(named:"Daytime")
            case 18...24:
                self.backgroundImage.image = UIImage(named: "NightDay")
            default:
                self.backgroundImage.image = UIImage(named:"NightDay")
            }
            
            self.cityNameLabel.text = self.weatherList[0].city_name!
            self.weatherTempLabel.text = "\(self.weatherList[0].temp!)°"
            self.weatherDesc.text = self.weatherList[0].weather?.description ?? ""
            self.sunsetLabel.text = self.weatherList[0].sunset!
            self.windyLabel.text = String(format: "%0.2f", self.weatherList[0].wind_spd!) + "m/s"
            self.cloudLabel.text = "\(self.weatherList[0].clouds!) %"
            self.dateLabel.text = self.weatherTime
            self.weatherIconIamge.image = UIImage(systemName: (self.weatherList[0].weather?.getIcon())!)
            
        }
    }
    
    func sendToDataView(weatherInfo: Array<WeatherForecast>) {
        self.weatherForecast = weatherInfo
        
        DispatchQueue.main.asyncAfter(deadline: .now()+0.33, execute:
                                        {
            self.weatherCollectionView.reloadData()
            self.weatherCollectionView.performBatchUpdates({
                self.animate()
            })
        })
        
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

extension HomepageViewController : UICollectionViewDelegate, UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  weatherForecast.count - 13
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let weatherForecast = weatherForecast[indexPath.row + 1]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "weatherCell", for: indexPath) as! WeatherCollectionViewCell
        cell.weatherImage.image = UIImage(systemName: (weatherForecast.weather?.getIcon())!)
        cell.weatherTemp.text = "\(weatherForecast.temp!)°"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let dateString = weatherForecast.datetime!
        
        if let date = dateFormatter.date(from: dateString) {
            
            dateFormatter.dateFormat = "MMM d"
            dateFormatter.locale = Locale(identifier: "en_US_POSIX")
            cell.weatherDay.text = dateFormatter.string(from: date)
            
        }
        
        return cell
    }
    
    
    
    
}
