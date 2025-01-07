import SwiftyNet

// MARK: - Model for Geocoding API response
struct GeocodingResponse: Codable {
    let name: String
    let lat: Double
    let lon: Double
    let country: String
    let state: String?
}

protocol WeatherAPIServiceProtocol {
    func fetchCoordinates(for city: String, limit: Int) async throws -> [GeocodingResponse]
}

final class WeatherAPIService: WeatherAPIServiceProtocol {
    private let httpClient: HTTPClientProtocol

    init(httpClient: HTTPClientProtocol = HTTPClient(
        cacheManager: CacheManager(),
        networkMonitor: NetworkMonitor()
    )) {
        self.httpClient = httpClient
    }

    func fetchCoordinates(for city: String, limit: Int = 5) async throws -> [GeocodingResponse] {
        try await httpClient.sendRequest(
            WeatherEndpoint.geocoding(city: city, limit: limit).endpoint,
            responseType: [GeocodingResponse].self
        )
    }
} 
