//
//  DateHelper.swift
//  Weather Forecast
//
//  Created by k2 tam on 03/09/2022.
//

import Foundation

class DateHelper{
    
    static func getCurrentHour() -> Int{
        let components = Calendar.current.dateComponents([.hour], from: Date())
        let hour = components.hour ?? 0
        
        
        return hour
    }
}
