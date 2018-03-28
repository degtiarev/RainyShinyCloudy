//
//  Forcast.swift
//  RainyShinyCloudy
//
//  Created by Aleksei Degtiarev on 17/03/2018.
//  Copyright © 2018 Aleksei Degtiarev. All rights reserved.
//

import UIKit
import Alamofire

class Forecast {
    
    var _date: String!
    var _weatherType: String!
    var _highTemp: String!
    var _lowTemp: String!
    
    var date: String!{
        if _date == nil {
            _date = ""
        }
        return _date
    }
    
    var weatherType: String!{
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    
    var highTemp: String!{
        if _highTemp == nil {
            _highTemp = ""
        }
        return _highTemp
    }
    
    var lowTemp: String!{
        if _lowTemp == nil {
            _lowTemp = ""
        }
        return _lowTemp
    }
    
    
    init(weatherDict: Dictionary<String, AnyObject>) {
        
        if let main = weatherDict["main"] as? Dictionary<String, AnyObject> {
            if let min = main["temp_min"] as? Double {
                let min_temperature = Int (min - 273.15)
                self._lowTemp = "\(min_temperature)°"
            }
            
            if let max = main["temp_max"] as? Double {
                let max_temperature =  Int (max - 273.15)
                self._highTemp = "\(max_temperature)°"
            }
        }
        
        if let weather = weatherDict["weather"] as? [Dictionary<String, AnyObject>] {
            if let main = weather[0]["main"] as? String {
                self._weatherType = main
            }
            
        }
        
        if let dt_txt = weatherDict ["dt_txt"] as? String {
            self._date = String (dt_txt.prefix(16))
        }
        
    }
    
}
