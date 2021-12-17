//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Tomás Santos on 16/12/2021.
//

import SwiftUI

struct WeatherView: View {
    var weather: ResponseBody
    var body: some View {
        ZStack(alignment: .leading){
            VStack{
                VStack(alignment: .leading, spacing: 5){
                    Text(weather.name)
                        .bold().font(.title)
                    Text("Today, \(Date().formatted(.dateTime.day().month().hour().minute()))")
                        .fontWeight(.light)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                Spacer()
                VStack{
                    HStack{
                        VStack(spacing: 20){
                            Image(systemName: "sun.max")
                                .font(.system(size: 40))
                            Text(weather.weather[0].main)
                        }
                        .frame(width: 150, alignment: .leading)
                        Spacer()
                        
                        Text(weather.main.feels_like.roundDouble() + "º")
                            .font(.system(size: 100))
                            .fontWeight(.bold)
                            .padding()
                    }
                    Spacer()
                        .frame(height: 80)
                    Spacer()
                }
                .frame(maxWidth: .infinity)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            VStack{
                Spacer()
                VStack(alignment: .leading, spacing: 20){
                    Text("Weather now")
                        .bold().padding(.bottom)
                    HStack{
                        WeatherRow(logo: "thermometer.snowflake", name: "Min temp", value: (weather.main.temp_min.roundDouble() + "º"))
                        Spacer()
                        WeatherRow(logo: "thermometer.sun", name: "Max temp               ", value: (weather.main.temp_max.roundDouble() + "º"))
                    }
                    HStack{
                        WeatherRow(logo: "thermometer", name: "Feels like", value: (weather.main.feels_like.roundDouble() + "º"))
                        Spacer()
                        WeatherRow(logo: "humidity", name: "Humidity                 ", value: (weather.main.humidity.roundDouble() + "%"))
                    }
                    HStack{
                        WeatherRow(logo: "wind", name: "Wind speed", value: (weather.main.temp_min.roundDouble() + "m/s"))
                        Spacer()
                        WeatherRow(logo: "arrow.down.forward.and.arrow.up.backward.circle", name: "Pressure", value: (weather.main.pressure.roundDouble() + "mb"))
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.bottom, 20)
                .foregroundColor(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
                .background(.white)
                .cornerRadius(20, corners: [.topLeft, .topRight])
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
        .preferredColorScheme(.dark)
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: previewWeather)
    }
}
