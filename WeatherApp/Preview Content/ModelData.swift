//
//  ModelData.swift
//  WeatherApp
//
//  Created by Tomás Santos on 16/12/2021.
//

import Foundation

var previewWeather: ResponseBody = load("weatherdata.json")

func load<T: Decodable>(_ filename: String) -> T{
    let data: Data
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else{
            fatalError("Couldn't find \(filename) in the main bundle.")
    }
    do{
        data = try Data(contentsOf: file)
    } catch{
        fatalError("Couldn't find \(filename) from main bundle:\n\(error)")
    }
    do{
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch{
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
