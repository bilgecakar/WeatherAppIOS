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
    
    func getCurrentWeather() {
        homeInteractor?.getCurrentWeather()
    }
    
    
}

extension HomepagePresenter : InteractorToPresenterHomepageProtocol
{
    func sendToDataPresenter(weatherInfo : Array<Weather>) {
        homeView?.sendToDataView(weatherInfo: weatherInfo)
    }
    
}

