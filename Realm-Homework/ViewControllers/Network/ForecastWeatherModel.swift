//
//  ForecastWeatherModel.swift
//  Realm-Homework
//
//  Created by Андрей Лапин on 16.01.2021.
//

import Foundation

struct ForecastWeatherModel: Codable {
    let cod: String
    let message: Int
    let cnt: Int
    let list: [ForecastWeatherModelSubList]
    let city: ForecastWeatherModelSubCity
}
struct ForecastWeatherModelSubList: Codable {
    let dt: Int
    let main: ForecastWeatherModelSubMain
    let weather: [ForecastWeatherModelSubWeather]
    let clouds: ForecastWeatherModelSubClouds
    let wind: ForecastWeatherModelSubWind
    let visibility: Int
    let pop: Float
    let snow: ForecastWeatherModelSubSnow
    let sys: ForecastWeatherModelSubSys
    let dt_txt: String
}
struct ForecastWeatherModelSubMain: Codable {
    let temp: Float
    let feelsLike: Float
    let tempMin: Float
    let tempMax: Float
    let pressure: Int
    let seaLevel: Int
    let grndLevel: Int
    let humidity: Int
    let tempKf: Float
    
    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure
        case seaLevel = "sea_level"
        case grndLevel = "grnd_level"
        case humidity
        case tempKf = "temp_kf"
    }
}
struct ForecastWeatherModelSubWeather: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}
struct ForecastWeatherModelSubClouds: Codable {
    let all: Int
}
struct ForecastWeatherModelSubWind: Codable {
    let speed: Float
    let deg: Int
}
struct ForecastWeatherModelSubSnow: Codable {
    let the3h: Float
    
    enum CodingKeys: String, CodingKey {
        case the3h = "3h"
    }
}
struct ForecastWeatherModelSubSys: Codable {
    let pod: String
}
struct ForecastWeatherModelSubCity: Codable {
    let id: Int
    let name: String
    let coord: ForecastWeatherModelSubCoord
    let country: String
    let population: Int
    let timezone: Int
    let sunrise: Int
    let sunset: Int
}
struct ForecastWeatherModelSubCoord: Codable {
    let lat: Float
    let lon: Float
}
