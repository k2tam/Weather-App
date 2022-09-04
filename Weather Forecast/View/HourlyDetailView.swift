//
//  HourlyDetailView.swift
//  Weather Forecast
//
//  Created by k2 tam on 03/09/2022.
//

import SwiftUI

struct HourlyDetailView: View {
    
    
    @EnvironmentObject var modelData: ModelData
    var hour: Int
    let showFahreheit: Bool

    
    var body: some View {
        if modelData.weather != nil{
            
            if showFahreheit{
                Text("\(String(format: "%.0f", modelData.weather!.hourly[hour].temp_far))°")
                    .font(Font.title2)

            }else{
                Text("\(String(format: "%.0f", modelData.weather!.hourly[hour].temp))°")
                    .font(Font.title2)
            }

        }
    }
}

struct HourlyDetailView_Previews: PreviewProvider {
    static var previews: some View {
        HourlyDetailView(hour: 15, showFahreheit: true)
    }
}
