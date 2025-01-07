protocol SearchLocationsUseCase {
    func execute(query: String, limit: Int) async throws -> [Location]
}

final class DefaultSearchLocationsUseCase: SearchLocationsUseCase {
    private let repository: WeatherRepository
    
    init(repository: WeatherRepository) {
        self.repository = repository
    }
    
    func execute(query: String, limit: Int) async throws -> [Location] {
        try await repository.searchLocations(query: query, limit: limit)
    }
} 