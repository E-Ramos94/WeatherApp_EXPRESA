//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by Kevin Pleitez on 8/6/23.
//

import Foundation

struct Data: Codable {
    var timelines: [Timelines]
}

struct Timelines: Codable {
    let timestep: String
    let endTime: String
    let startTime: String
    let intervals: [Intervals]
}

struct Intervals: Codable {
    let startTime: String
    let values: [Values]
}

struct Values: Codable{
    let temperature: Float
}
