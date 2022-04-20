//
//  HomepageInteractor.swift
//  WeatherAppIOS
//
//  Created by Bilge Çakar on 19.04.2022.
//

import Foundation

class HomepageInteractor : PresenterToInteractorHomepageProtocol
{
    var homePresenter: InteractorToPresenterHomepageProtocol?
    
    func getCurrentWeather() {
        
        let url = URL(string: "https://api.weatherbit.io/v2.0/current?lat=35.7796&lon=-78.6382&key=1b45ce95c85f49f489fd96cc081c71c7&include=minutely")!
        URLSession.shared.dataTask(with: url){ data, response, error in
            
            if error != nil || data == nil
            {
                print("Hata")
                return
            }
            
            do
            {
                let answer = try JSONDecoder().decode(WeatherResponse.self, from : data!)
                print(answer.data![0].city_name!)
                
            }
            catch
            {
                print("JSON ERROR : \(error.localizedDescription)")
            }
            
        }.resume()
        
    }
    
    
}

