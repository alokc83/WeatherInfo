import Foundation
import SwiftyNet

enum WeatherEndpoint {
    case geocoding(city: String, limit: Int = 5)
    case currentWeather(lat: Double, lon: Double)
    
    private static let baseURL = URL(string: "https://api.openweathermap.org")!
    private static let apiKey = "632a2661971b4bc496854ab2ad10fb42"
    
    var endpoint: Endpoint {
        switch self {
        case .geocoding(let city, let limit):
            return Endpoint(
                baseURL: Self.baseURL,
                path: "/geo/1.0/direct",
                method: .get,
                queryItems: [
                    URLQueryItem(name: "q", value: city),
                    URLQueryItem(name: "limit", value: "\(limit)"),
                    URLQueryItem(name: "appid", value: Self.apiKey)
                ]
            )
            
        case .currentWeather(let lat, let lon):
            return Endpoint(
                baseURL: Self.baseURL,
                path: "/data/2.5/weather",
                method: .get,
                queryItems: [
                    URLQueryItem(name: "lat", value: "\(lat)"),
                    URLQueryItem(name: "lon", value: "\(lon)"),
                    URLQueryItem(name: "appid", value: Self.apiKey)
                ]
            )
        }
    }
} 