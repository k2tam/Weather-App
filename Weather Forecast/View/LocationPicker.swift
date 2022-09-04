//
//  LocationPicker.swift
//  Weather Forecast
//
//  Created by k2 tam on 02/09/2022.
//

import SwiftUI

struct LocationPicker: View {
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        ZStack{
            //Background color
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.blue.opacity(0.6)]), startPoint: .topLeading, endPoint: .trailing)
                .ignoresSafeArea()
            
            VStack(spacing: 15){
                Text("Choose your location")
                
                Picker(selection: $modelData.selectedLocation) {
                    ForEach(0..<modelData.locations.count){
                        Text(modelData.locations[$0].name)
                    }
                } label: {
                    Text("")
                }


                
                Text("Weather data will be shown for")
            }
        }
        .navigationTitle("Location")
    }
}

struct LocationPicker_Previews: PreviewProvider {
    static var previews: some View {
        LocationPicker()
    }
}
