//
//  Weather.swift
//  WeatherAppIOS
//
//  Created by Bilge Çakar on 19.04.2022.
//

import Foundation

class Weather : Codable
{
    var temp : Double?
    var city_name : String?
    var wind_spd : Double?
    var wind_cdir_full : String?
    var wind_cdir : String?
    var sunrise : String?
    var timezone : String?
    var clouds : Int?
    var weather : WeatherDetail?
    
    private init(){}
    
}
