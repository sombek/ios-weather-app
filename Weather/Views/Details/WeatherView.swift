//
//  WeatherView.swift
//  Weather
//
//  Created by Abdullah Hashim on 25/02/2023.
//

import SwiftUI

struct WeatherView: View {
    @State private var searchText = ""
    
    var searchResults: [Forecast] {
        if searchText.isEmpty {
            return Forecast.cities
        } else {
            return Forecast.cities.filter {
                $0.location.lowercased().contains(searchText.lowercased())
            }
        }
    }
    var body: some View {
        ZStack {
            // MARK: Background
            Color.background
                .ignoresSafeArea()
            
            // MARK: Weather Widgets
            ScrollView(showsIndicators: false) {
                VStack(spacing: 20) {
                    ForEach(searchResults) { forecast in
                        WeatherWdiget(forecast: forecast)
                    }
                }
            }
            .safeAreaInset(edge: .top) {
                EmptyView()
                    .frame(height: 110)
            }
        }
        .overlay{
            // MARK: Navigation Bar
            NavigationBar(searchText: $searchText)
        }
        .navigationBarHidden(true)
        .searchable(text: $searchText)
        
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
            .preferredColorScheme(.dark)
    }
}
