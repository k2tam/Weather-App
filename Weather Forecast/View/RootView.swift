//
//  ContentView.swift
//  Weather Forecast
//
//  Created by k2 tam on 02/09/2022.
//

import SwiftUI

struct RootView: View {
    @State var showFahreheit = false
    
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        NavigationView{
            ZStack{
                //Background color
                LinearGradient(gradient: Gradient(colors: [Color.blue, Color.blue.opacity(0.6)]), startPoint: .topLeading, endPoint: .trailing)
                    .ignoresSafeArea()
                
                VStack(alignment: .leading){
                    Spacer()
                    
                    //Locations,swich toggle C-F
                    NavigationLink {
                        LocationPicker()
                    } label: {
                        LocationView(showFahreheit: $showFahreheit)
                    }

                    
                    Spacer()
                    
                    //Current weather
                    Text("Current weather")
                        .font(Font.largeTitle)
                    
                    
                    CurrentWeatherView(showFehrahait: showFahreheit)
                        .environmentObject(CurrentWeatherViewModel())
                    
                    Spacer()
                    //Hourly Forecast
                    
                    Text("Hourly Forecast")
                        .font(Font.largeTitle)
                    
                    HourlyView(showFahreheit: showFahreheit)
                    
                    Spacer()
                }
                .padding(.horizontal)
            }
            .onAppear(){
                modelData.refesh()
            }
            .navigationTitle("Weather Forecast")
        }
            .accentColor(.black)
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
