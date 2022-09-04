//
//  CurrentWeatherViewModel.swift
//  Weather Forecast
//
//  Created by k2 tam on 03/09/2022.
//

import Foundation
import SwiftUI

class CurrentWeatherViewModel: ObservableObject{

    let isDay = true
    
    func getCurrentWeatherIconUrl(modelData: ModelData) -> String{
        let currentHour = DateHelper.getCurrentHour()
        var iconCode: String?
        var iconUrlStr: String?
 
        if modelData.weather != nil{
            iconCode = modelData.weather!.current.weather[currentHour].icon
            
            iconUrlStr = "https://openweathermap.org/img/wn/\(iconCode!)@2x.png"
            
        }
        
        return iconUrlStr ?? ""
    }
}
