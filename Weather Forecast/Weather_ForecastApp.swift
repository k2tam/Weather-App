//
//  Weather_ForecastApp.swift
//  Weather Forecast
//
//  Created by k2 tam on 02/09/2022.
//

import SwiftUI

@main
struct Weather_ForecastApp: App {
    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(ModelData())
        }
    }
}
