//
//  CurrentWeather.swift
//  RainyShinyCloudy
//
//  Created by Aleksei Degtiarev on 16/03/2018.
//  Copyright © 2018 Aleksei Degtiarev. All rights reserved.
//

import UIKit
import Alamofire

class CurrentWeather {
    
    var _cityName: String!
    var _date: String!
    var _weatherType: String!
    var _currentTemp: Int!
    
    var cityName: String {
        if _cityName == nil {
            _cityName = ""
        }
        return _cityName
    }
    
    var date: String {
        if _date == nil {
            _date = ""
        }
        
        let dateFormater = DateFormatter()
        dateFormater.dateStyle = .long
        dateFormater.timeStyle = .none
        let currentDate = dateFormater.string (from: Date() )
        self._date = "Today, \(currentDate)"
        
        return _date
    }
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    
    
    var currentTemp: Int {
        if _currentTemp == nil {
            _currentTemp = 0
        }
        return _currentTemp
    }
    
    
    func downloadWeatherDetails(completed: @escaping DownloadComplete){
        // Alamofire download
        Alamofire.request(CURRENT_WEATHER_URL).responseJSON { response in
            let result = response.result
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                
                if let name = dict["name"] as? String {
                    self._cityName = name.capitalized
                }
                
                if let weather = dict["weather"] as? [Dictionary<String, AnyObject>] {
                    if let main = weather[0]["main"] as? String {
                        self._weatherType = main.capitalized
                    }
                }
                
                if let main = dict["main"] as? Dictionary<String, AnyObject> {
                    if let temp = main["temp"] as? Double {
                        let current_temperature = Int (temp - 273.15)
                        self._currentTemp = current_temperature
                    }
                }
                
            }
            completed()
        }
        
    }
    
}




