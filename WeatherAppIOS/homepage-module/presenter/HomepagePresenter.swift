//
//  HomepagePresenter.swift
//  WeatherAppIOS
//
//  Created by Bilge Çakar on 19.04.2022.
//

import Foundation

class HomepagePresenter : ViewToPresenterHomepageProtocol
{
    var homeInteractor: PresenterToInteractorHomepageProtocol?
    
    var homeView: PresenterToViewHomepageProtocol?
    
    func getCurrentWeather(cityName : String, counrty : String) {
        homeInteractor?.getCurrentWeather(cityName : cityName, counrty : counrty)
    }
    
    func sevenDayWeather() {
        homeInteractor?.sevenDayWeather()
    }
    
    
}

extension HomepagePresenter : InteractorToPresenterHomepageProtocol
{
    func sendToDataPresenter(weatherInfo : Array<Weather>) {
        homeView?.sendToDataView(weatherInfo: weatherInfo)
    }
    func sendToDataPresenter(weatherInfo: Array<WeatherForecast>) {
        homeView?.sendToDataView(weatherInfo: weatherInfo)
    }
    
}

