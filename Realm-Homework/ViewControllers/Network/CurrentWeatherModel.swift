//
//  CurrentWeatherModel.swift
//  Realm-Homework
//
//  Created by Андрей Лапин on 16.01.2021.
//

import Foundation

struct CurrentWeatherModel: Codable {
    let coord: CurrentWeatherSubCorod
    let weather: [CurrentWeatherSubWeather]
    let base: String
    let main: CurrentWeatherSubMain
    let visibility: Int
    let wind: CurrentWeatherSubWind
    let snow: CurrentWeatherSubSnow
    let clouds: CurrentWeatherSubClouds
    let dt: Int
    let sys: CurrentWeatherSubSys
    let timezone: Int
    let id: Int
    let name: String
    let cod: Int
}
struct CurrentWeatherSubCorod: Codable {
    let lon: Double
    let lat: Double
}
struct CurrentWeatherSubWeather: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}
struct CurrentWeatherSubMain: Codable {
    let temp, feelsLike, tempMin, tempMax: Double
    let pressure, humidity: Int
    
    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure, humidity
    }
}
struct CurrentWeatherSubWind: Codable {
    let speed, deg: Int
}
struct CurrentWeatherSubSnow: Codable {
    let the1h: Double
    
    enum CodingKeys: String, CodingKey {
        case the1h = "1h"
    }
}
struct CurrentWeatherSubClouds: Codable {
    let all: Int
}
struct CurrentWeatherSubSys: Codable {
    let type, id: Int
    let country: String
    let sunrise, sunset: Int
}
