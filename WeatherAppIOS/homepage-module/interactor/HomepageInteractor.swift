//
//  HomepageInteractor.swift
//  WeatherAppIOS
//
//  Created by Bilge Çakar on 19.04.2022.
//

import Foundation
import UIKit

class HomepageInteractor : PresenterToInteractorHomepageProtocol
{
    var homePresenter: InteractorToPresenterHomepageProtocol?
    
    func getCurrentWeather(cityName : String) {
        
        let replaced = cityName.replacingOccurrences(of: " ", with: "_")
        let url = URL(string: "https://api.weatherbit.io/v2.0/current?city=\(replaced)&key=1b45ce95c85f49f489fd96cc081c71c7")!
        
        
        URLSession.shared.dataTask(with: url){ data, response, error in
            
            if error != nil || data == nil
            {
                print("Hata")
                return
            }
            
            do
            {
                let answer = try JSONDecoder().decode(WeatherResponse.self, from: data!)
                var list = [Weather]()
                if let answerList = answer.data
                {
                    list = answerList
                }
                
                
                
                self.homePresenter?.sendToDataPresenter(weatherInfo: list)
            }
            catch
            {
                print("JSON ERROR : \(error.localizedDescription)")
            }
            
        }.resume()
        
    }
    
    func sevenDayWeather(cityName : String) {
        
        let replaced = cityName.replacingOccurrences(of: " ", with: "_")
        let url = URL(string: "https://api.weatherbit.io/v2.0/forecast/daily?city=\(replaced)&key=1b45ce95c85f49f489fd96cc081c71c7")!
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if error != nil || data == nil
            {
                print("Hata")
                return
            }
            
            do
            {
                let answer = try JSONDecoder().decode(WeatherForecastResponse.self, from: data!)
                var listTwo = [WeatherForecast]()
                if let answerWeatherList = answer.data
                {
                    listTwo = answerWeatherList
                }
                
                self.homePresenter?.sendToDataPresenter(weatherInfo: listTwo)
                
            }
            catch
            {
                print("JSON ERROR : \(error.localizedDescription)")
            }
        }.resume()
        
    }
    
    
}

