//
//  ForcastCard.swift
//  Weather
//
//  Created by Abdullah Hashim on 25/02/2023.
//

import SwiftUI

struct ForcastCard: View {
    var forecast: Forecast
    var forcastPeriod: ForecastPeriod
    
    var isActive: Bool {
        if forcastPeriod == ForecastPeriod.hourly {
            let isThisHour = Calendar.current.isDate(.now, equalTo: forecast.date, toGranularity: .hour)
            return isThisHour
        }
        else {
            let isToday = Calendar.current.isDate(.now, equalTo: forecast.date, toGranularity: .day)
            return isToday
        }
    }
    
    var body: some View {
        ZStack {
            // MARK: Card
            RoundedRectangle(cornerRadius: 30)
                .fill(Color.forecastCardBackground.opacity(isActive ? 1 : 0.2))
                .frame(width: 60, height: 146)
                .shadow(color: .black.opacity(0.25), radius: 10, x: 5,y: 4)
                .overlay {
                    // MARK: Card Border
                    RoundedRectangle(cornerRadius: 30)
                        .strokeBorder(.white.opacity(isActive ? 0.5 : 0.2))
                        .blendMode(.overlay)
                }
                .innerShadow(
                    shape: RoundedRectangle(cornerRadius: 30),
                    color: .white.opacity(0.25),
                    linewidth: 1,
                    offsetX: 1,
                    offsetY: 1,
                    blur: 0,
                    blendMode: .overlay
                )
            
            // MARK: Content
            VStack(spacing: 16) {
                // MARK: Forecast Date
                Text(forecast.date, format: forcastPeriod == ForecastPeriod.hourly ? .dateTime.hour() : .dateTime.weekday() )
                    .font(.subheadline.weight(.semibold))
                
                VStack(spacing: -4) {
                    // MARK: Forecast Small Icon
                    Image("\(forecast.icon) small")
                    
                    // MARK: Forecast Probability
                    Text(forecast.probability, format: .percent)
                        .font(.footnote.weight(.semibold))
                        .foregroundColor(Color.probabilityText)
                        .opacity(forecast.probability > 0 ? 1 : 0)
                }
                .frame(height: 42)
                
                // MARK: Forecast Temp
                Text("\(forecast.temperature)°")
                    .font(.title3)
            }
            .padding(.horizontal, 8)
            .padding(.vertical, 16)
            .frame(width: 60, height: 146)
        }
    }
}

struct ForcastCard_Previews: PreviewProvider {
    static var previews: some View {
        ForcastCard(forecast: Forecast.hourly[1], forcastPeriod: .hourly)
    }
}
