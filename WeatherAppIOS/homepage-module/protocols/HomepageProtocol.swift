//
//  HomepageProtocol.swift
//  WeatherAppIOS
//
//  Created by Bilge Çakar on 19.04.2022.
//

import Foundation

protocol ViewToPresenterHomepageProtocol
{
    var homeInteractor : PresenterToInteractorHomepageProtocol? {get set}
    var homeView : PresenterToViewHomepageProtocol? {get set}
    
    func getCurrentWeather(cityName : String)
    func sevenDayWeather()
}
protocol PresenterToInteractorHomepageProtocol
{
    var homePresenter : InteractorToPresenterHomepageProtocol? {get set}
    
    func getCurrentWeather(cityName : String)
    func sevenDayWeather()
}
protocol InteractorToPresenterHomepageProtocol
{
    func sendToDataPresenter(weatherInfo : Array<Weather>)
    func sendToDataPresenter(weatherInfo : Array<WeatherForecast>)
}
protocol PresenterToViewHomepageProtocol
{
    func sendToDataView(weatherInfo : Array<Weather>)
    func sendToDataView(weatherInfo : Array<WeatherForecast>)
}
protocol PresenterToRouterHomepageProtocol
{
    static func createModule(ref:HomepageViewController)
    
}
