//
//  CurrentWeatherView.swift
//  Weather Forecast
//
//  Created by k2 tam on 03/09/2022.
//

import SwiftUI

struct CurrentWeatherView: View {
    
    @EnvironmentObject var modelData: ModelData
    @EnvironmentObject var currentWeatherViewModel: CurrentWeatherViewModel
    var showFehrahait: Bool
    
    var imgUrlStr: String {
        currentWeatherViewModel.getCurrentWeatherIconUrl(modelData: self.modelData)
    }
    
    
    
    var body: some View {
        HStack{
            //Weather status by icon
            
            
            
            AsyncImage(url: URL(string: imgUrlStr)){phase in
                switch phase {
                           // 1
                           case .empty:
                               ProgressView()
                           // 2
                           case .success(let image):
                               image
                                   .resizable()
                                   .scaledToFit()
                           // 3
                           case .failure(_):
                               Image(systemName: "xmark")
                                   .resizable()
                                   .scaledToFit()
                                   .foregroundColor(Color.red)
                           // 4
                           @unknown default:
                               Image(systemName: "xmark")
                                   .resizable()
                                   .scaledToFit()
                                   .foregroundColor(Color.red)
                           }
            }
            .frame(width: 90, height: 90)
             
            
            if(modelData.weather != nil){
                
                VStack{
                    
                    HStack{
                        //Fehrahait
                        if showFehrahait{
                            Text("\(String(format: "%.0f", (modelData.weather!.current.temp_far)))°")
                                .padding(.leading)
                                .dynamicTypeSize(.accessibility3)
                            
                            
                            //Feels like
                            Text("Feels like \(String(format: "%.0f", modelData.weather!.current.feels_like_far))")
                        //Celcius
                        }else{
                            Text("\(String(format: "%.0f", (modelData.weather!.current.temp)))°")
                                .padding(.leading)
                                .dynamicTypeSize(.accessibility3)
                            
                            
                            //Feels like
                            Text("Feels like \(String(format: "%.0f", modelData.weather!.current.feels_like))")                        }
                        
                    }
                    
                    
                    Text("\(modelData.weather!.current.weather[0].description)")
                }
            }
            
        }
    }
}

struct CurrentWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentWeatherView(showFehrahait: true)
    }
}
