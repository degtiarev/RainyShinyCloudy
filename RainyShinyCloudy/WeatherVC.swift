//
//  ViewController.swift
//  RainyShinyCloudy
//
//  Created by Aleksei Degtiarev on 16/03/2018.
//  Copyright © 2018 Aleksei Degtiarev. All rights reserved.
//

import UIKit
import Alamofire

class WeatherVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var currentTemperatureLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var currentWeatherImage: UIImageView!
    @IBOutlet weak var currentWeatherTypeLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    var currentWeather: CurrentWeather!
    var forecast: Forecast!
    var forecasts = [Forecast]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        currentWeather = CurrentWeather()
        
        
        currentWeather.downloadWeatherDetails {
            self.downloadForecastData {
                self.updateMainUI()
            }
        }
        
    }
    
    func downloadForecastData (completed: @escaping DownloadComplete) {
        // downloading forecast weather data for Tableview
        
        Alamofire.request(FORCAST_URL).responseJSON { response in
            let result = response.result
            if let dict = result.value as? Dictionary<String, AnyObject> {
                
                if let list = dict["list"] as? [Dictionary<String, AnyObject>] {
                    
                    for obj in list {
                        let forecast = Forecast(weatherDict: obj)
                        self.forecasts.append(forecast)
                        print(obj)
                    }
                    
                    self.tableView.reloadData()
                }
                
            }
            
            completed()
            
        }
        
        
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // number of cells
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecasts.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath) as? WeatherCell {
            let forcast = forecasts[indexPath.row]
            cell.configureCell(forecast: forcast)
              return cell
        } else {
            return WeatherCell()
        }
      
    }
    
    
    func updateMainUI() {
        dateLabel.text = currentWeather.date
        currentTemperatureLabel.text = "\(currentWeather.currentTemp)°"
        locationLabel.text = currentWeather.cityName
        currentWeatherTypeLabel.text = currentWeather.weatherType
        currentWeatherImage.image = UIImage(named: currentWeather.weatherType)
        
    }
    
}

