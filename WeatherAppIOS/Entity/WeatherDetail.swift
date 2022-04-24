//
//  WeatherDetail.swift
//  WeatherAppIOS
//
//  Created by Bilge Çakar on 22.04.2022.
//

import Foundation

class WeatherDetail : Codable
{
    var description : String?
    var icon : String?
    
    //Own icon sets
    func getIcon()->String
    {
        
        switch icon
        {
        case "t01d","t02d","t03d","t01n","t02n","t03n" : return "cloud.bolt.rain"
        case "t04d","t04n","t05d","t05n": return "cloud.bolt"
        case "d01d","d01n","d02d","d02n","d03d","d03n": return "cloud.drizzle"
        case "r01d", "r01n","r02d","r02n": return "cloud.rain"
        case "r03d","r03n": return "cloud.heavyrain"
        case "f01d","f01n","r04d","r04n","r05d","r05n","r06d","r06n": return "cloud.rain"
        case "s01d","s01n","s02d","s02n","s03d","s03n","s04d","s04n": return "cloud.snow"
        case "s05d","s05n": return "cloud.sleet"
        case "a01d","a01n","a02d","a02n","a03d","a03n","a04d","a04n","a05d","a05n","a06d","a06n": return "smoke"
        case "c01d","c01n": return "sun.max"
        case "c02d", "c02n","c03d","c03n": return "cloud.sun"
        case "c04d","c04n": return "smoke"
        default:
            return "cloud"
        }
    }
    
}
