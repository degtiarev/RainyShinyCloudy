//
//  Constants.swift
//  RainyShinyCloudy
//
//  Created by Aleksei Degtiarev on 16/03/2018.
//  Copyright © 2018 Aleksei Degtiarev. All rights reserved.
//

import Foundation

let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"
let LATTITUDE = "lat="
let LONGITUDE = "&lon="
let APP_ID = "&appid="
let API_KEY = "ac5511bddabc13ed9ef1d7bc748e7e20"

typealias DownloadComplete = () -> () 

let CURRENT_WEATHER_URL = "\(BASE_URL)\(LATTITUDE)68.44\(LONGITUDE)17.43\(APP_ID)\(API_KEY)"
let FORCAST_URL = "http://api.openweathermap.org/data/2.5/forecast?lat=68.44&lon=17.43&appid=ac5511bddabc13ed9ef1d7bc748e7e20"
