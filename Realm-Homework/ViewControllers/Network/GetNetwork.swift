//
//  GetNetwork.swift
//  Realm-Homework
//
//  Created by Андрей Лапин on 16.01.2021.
//

import Foundation

class Network {
    static let shared = Network()
    
    func getCurrentWeather(completion: @escaping (String) -> Void) {
        let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=Moscow&appid=600eabbd67b0d53a6908f8b67898b8c0")!
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else { return }
            do {
                let json = try JSONDecoder().decode(CurrentWeatherModel.self, from: data)
                let nowTemp = String(Int(round(json.main.temp - 273.15)))
                DispatchQueue.main.async {
                    completion(nowTemp)
                }
                
            }catch(let error) {
                print("ERROR--------")
                print(error)
            }
        }
        task.resume()
    }
    func getForecast() {
        let url = URL(string: "api.openweathermap.org/data/2.5/forecast?q=Moscow&appid=600eabbd67b0d53a6908f8b67898b8c0")!
        let request = URLRequest(url: url)
        let _ = URLSession.shared.dataTask(with: request) { data, _, _ in
            guard let data = data else { return }
            do {
                let json = try JSONDecoder().decode(ForecastWeatherModel.self, from: data)
                var temps: [Int]
                for el in json.list {
                    print(el)
                }
            }catch(let error) {
                print("ERROR----------------")
                print(error)
            }
        }
    }
}
