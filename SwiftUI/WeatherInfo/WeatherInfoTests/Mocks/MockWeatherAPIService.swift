@testable import WeatherInfo

final class MockWeatherAPIService: WeatherAPIServiceProtocol {
    private let mockResponses: [GeocodingResponse]
    private let shouldFail: Bool
    private(set) var requestCount = 0
    
    init(mockResponses: [GeocodingResponse] = [], shouldFail: Bool = false) {
        self.mockResponses = mockResponses
        self.shouldFail = shouldFail
    }
    
    func fetchCoordinates(for city: String, limit: Int) async throws -> [GeocodingResponse] {
        requestCount += 1
        
        if shouldFail {
            struct MockError: Error {}
            throw MockError()
        }
        
        return mockResponses
    }
} 