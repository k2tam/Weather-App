//
//  ModelData.swift
//  Weather Forecast
//
//  Created by k2 tam on 02/09/2022.
//


import Foundation
import Combine

class ModelData: ObservableObject{
    
    @Published var weather: Weather?
    @Published var locations: [Location]
    @Published var selectedLocation = 0
    
    init() {
        // Create dummy data
        let HoChiMinh = Location(name: "Ho Chi Minh, District 7", lat: 10.731839, lon: 106.702827)
        let BaoLoc = Location(name: "Bao Loc, Lam Dong", lat: 11.5390902, lon: 107.7966869)
        let HaNoi = Location(name: "Ha Noi, VietNam", lat: 21.030653, lon: 105.847130)
        
        self.locations = [HoChiMinh,BaoLoc,HaNoi]
        self.loadWeatherData(locations[selectedLocation].lat, locations[selectedLocation].lon)
    }

    
    func loadWeatherData(_ lat: Double, _ lon: Double) {
    
        
        //API key:
        let apiKey = "49e22ebfd509bb813d363bae2fbe6fe3"
        
        //URL
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/onecall?lat=\(lat)&lon=\(lon)&exclude=minutely&units=metric&appid=\(apiKey)")
        else{
            fatalError("Invalid url")
        }
        
        //Get Url session
        let session = URLSession.shared
        
        //Create a data task to API
        session.dataTask(with: url) { data, response, error in
            do{
                if error == nil && data != nil{
                    //Decode JSON data obtained from the url
                    let decoder = JSONDecoder()
                    let weatherData = try decoder.decode(Weather.self, from: data!)
                    
                    DispatchQueue.main.async {
                        self.weather = weatherData
                    }
                    
                    
                }
            }catch{
                fatalError("Couldn't parse JSON as Weather:\n\(error)")
            }
        }
        .resume()
    }
    
    
    //Function refresh data when a new location is selected
    func refesh(){
        loadWeatherData(locations[selectedLocation].lat, locations[selectedLocation].lon)
    }
}

