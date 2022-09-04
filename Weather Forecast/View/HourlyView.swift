//
//  HourlyView.swift
//  Weather Forecast
//
//  Created by k2 tam on 03/09/2022.
//

import SwiftUI

struct HourlyView: View {
    let showFahreheit: Bool
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack(spacing: 10){
                //Loops through the next 12 hours of weather data from API
                ForEach(0..<12){ index in
                    VStack{
                        // Converts the indexes to the next 12 hours based on current time, ex. 1:00, 2:00, 3:00, etc.
                        let hour = DateHelper.getCurrentHour()
                        
                        Text("\((index+hour) % 24):00")
                            .font(Font.title3)
                        
                        HourlyDetailView(hour: hour+index, showFahreheit: self.showFahreheit)
    
                    }
                }
            }
           
        }
    }
}

struct HourlyView_Previews: PreviewProvider {
    static var previews: some View {
        HourlyView(showFahreheit: true)
    }
}
