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
    
    func getCurrentWeather()
}
protocol PresenterToInteractorHomepageProtocol
{
    var homePresenter : InteractorToPresenterHomepageProtocol? {get set}
    
    func getCurrentWeather()
}
protocol InteractorToPresenterHomepageProtocol
{
    func sendToDataPresenter()
}
protocol PresenterToViewHomepageProtocol
{
    func sendToDataView()
}
protocol PresenterToRouterHomepageProtocol
{
    static func createModule(ref:HomepageViewController)
}
