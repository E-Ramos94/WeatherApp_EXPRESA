//
//  ContentView.swift
//  WeatherApp
//
//  Created by Kevin Pleitez on 8/6/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var vm = WeatherViewModel()
    
    var body: some View {
        ScrollView {
            Text("Weather App")
                .font(.title)
                .bold()
            
            VStack{
                ForEach(vm.timelines, id: \.timestep) {tl in
                    VStack{
                        Text(tl.timestep)
                        Divider()
                        Text(tl.endTime)
                        Text(tl.startTime)
                    }
                }
                
            }.frame(maxWidth: .infinity,
                    alignment: .leading)
            .padding()
            .background(Color.gray.opacity(0.1), in: RoundedRectangle(cornerRadius: 10,
                                                                      style: .continuous))
            .padding(.horizontal, 4)
        }
        .onAppear(perform: vm.fetchData)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
