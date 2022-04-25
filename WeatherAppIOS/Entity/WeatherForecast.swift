//
//  WeatherForecast.swift
//  WeatherAppIOS
//
//  Created by Bilge Çakar on 23.04.2022.
//

import Foundation
class WeatherForecast : Codable
{
    var temp : Double?
    var datetime : String?
    var weather : WeatherDetail?
    
    init(temp : Double, datetime : String)
    {
        self.temp = temp
        self.datetime = datetime
    }
}
