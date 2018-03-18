//
//  WeatherCellTableViewCell.swift
//  RainyShinyCloudy
//
//  Created by Aleksei Degtiarev on 18/03/2018.
//  Copyright © 2018 Aleksei Degtiarev. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {

    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var weatherType: UILabel!
    @IBOutlet weak var highTemp: UILabel!
    @IBOutlet weak var lowTemp: UILabel!
    
  
    func configureCell (forecast: Forecast) {
        lowTemp.text = forecast.lowTemp
        highTemp.text = forecast.highTemp
        weatherType.text = forecast.weatherType
        dayLabel.text = forecast.date
        weatherIcon.image = UIImage(named: forecast.weatherType)
        
    }
    

}
