//
//  LocationView.swift
//  Weather Forecast
//
//  Created by k2 tam on 02/09/2022.
//

import SwiftUI

struct LocationView: View {
    @EnvironmentObject var ModelData: ModelData
    
    @Binding var showFahreheit: Bool
    var body: some View {
        HStack{
            Image(systemName: "location")
                .resizable()
                .frame(width: 30, height: 30)
            
            Text(ModelData.locations[ModelData.selectedLocation].name)
                        
            
            Toggle(isOn: $showFahreheit) {}
            
            Text(showFahreheit ? "F" : "C")
        }
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView(showFahreheit: Binding.constant(true))
    }
}
