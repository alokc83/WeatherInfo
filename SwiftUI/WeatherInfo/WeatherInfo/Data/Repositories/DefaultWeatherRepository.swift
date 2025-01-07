final class DefaultWeatherRepository: WeatherRepository {
    private let apiService: WeatherAPIServiceProtocol
    
    init(apiService: WeatherAPIServiceProtocol) {
        self.apiService = apiService
    }
    
    func searchLocations(query: String, limit: Int) async throws -> [Location] {
        let responses = try await apiService.fetchCoordinates(for: query, limit: limit)
        return responses.map { response in
            Location(
                name: response.name,
                latitude: response.lat,
                longitude: response.lon,
                country: response.country,
                state: response.state
            )
        }
    }
    
//    func getCurrentWeather(latitude: Double, longitude: Double) async throws -> Weather {
//        // Implement when needed
//        fatalError("Not implemented")
//    }
} 
