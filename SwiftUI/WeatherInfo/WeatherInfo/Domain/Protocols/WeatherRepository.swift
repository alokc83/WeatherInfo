protocol WeatherRepository {
    func searchLocations(query: String, limit: Int) async throws -> [Location]
   // func getCurrentWeather(latitude: Double, longitude: Double) async throws -> Weather
} 
