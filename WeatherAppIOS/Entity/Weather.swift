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
        
    init(city_name : String, temp : Double, wind_spd : Double, wind_cdir_full : String, wind_cdir : String   )
    {
        self.city_name = city_name
        self.wind_spd = wind_spd
        self.wind_cdir = wind_cdir
        self.wind_cdir_full = wind_cdir_full
    }
    
}
