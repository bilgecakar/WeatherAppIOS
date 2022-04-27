//
//  HomepageRouter.swift
//  WeatherAppIOS
//
//  Created by Bilge Çakar on 19.04.2022.
//

import Foundation

class HomepageRouter : PresenterToRouterHomepageProtocol
{
    static func createModule(ref: HomepageViewController) {
        
        let presenter = HomepagePresenter()
        ref.homePresenterObject = presenter
        ref.homePresenterObject?.homeView = ref
        ref.homePresenterObject?.homeInteractor = HomepageInteractor()
        ref.homePresenterObject?.homeInteractor?.homePresenter = presenter
    }
    
}
