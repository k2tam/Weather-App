//
//  ConversionHelper.swift
//  Weather Forecast
//
//  Created by k2 tam on 02/09/2022.
//

import Foundation

class ConversionHelper{
    
    static func celciusToFahr(temp: Double) -> Double{
        return (temp * (9/5)) + 32
    }
}
