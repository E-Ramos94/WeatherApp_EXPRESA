//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Kevin Pleitez on 8/6/23.
//

import Foundation

final class WeatherViewModel: ObservableObject{
    @Published var timelines: [Timelines] = []
    
    func Getdata() async {
        do {
            let url = URL(string: "https://api.tomorrow.io/v4/timelines?location=40.75872069597532,-73.98529171943665&fields=temperature&timesteps=1h&units=metric&apikey=ZZcJnLf64pIsuPMTa8G1sVWSOzNBd3KZ")!
            let (data, _) = try await URLSession.shared.data(from: url)
            let decodedData = try JSONDecoder().decode([Timelines].self, from: data)
            DispatchQueue.main.async {
                self.timelines = decodedData
            }
        }
        catch{
            print("Error cargando la data")
        }
    }
    func fetchData() {
    
        
        let usersUrlString = "https://api.tomorrow.io/v4/timelines?location=40.75872069597532,-73.98529171943665&fields=temperature&timesteps=1h&units=metric&apikey=ZZcJnLf64pIsuPMTa8G1sVWSOzNBd3KZ"
        if let url = URL(string: usersUrlString) {
            
            URLSession
                .shared
                .dataTask(with: url) { [weak self] data, response, error in
                    
                    DispatchQueue.main.async {
                        if let error = error {
                            print("Error en url")
                        } else {
                            
                            let decoder = JSONDecoder()
                            decoder.keyDecodingStrategy = .convertFromSnakeCase // maneja las propiedas para mirarse asi first_name > firstname
                            
                            if let data = data,
                               let decodedData = try? decoder.decode([Timelines].self, from: data) {
                                //TODO: maneja la configuracion de la data
                                
                                self?.timelines = decodedData
                                
                            } else {
                                print("error decodificando")
                            }
                            
                        }
                        
                    }
                    
                }.resume()
        }
    
    }
}
