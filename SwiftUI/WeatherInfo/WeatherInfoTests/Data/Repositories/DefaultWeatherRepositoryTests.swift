import Testing
import XCTest
@testable import WeatherInfo

struct DefaultWeatherRepositoryTests {
    @Test func testSearchLocationsMapping() async throws {
        // Given
        let mockResponse = [
            GeocodingResponse(name: "London", lat: 51.5074, lon: -0.1278, country: "GB", state: nil),
            GeocodingResponse(name: "London", lat: 42.9834, lon: -81.233, country: "CA", state: "Ontario")
        ]
        let apiService = MockWeatherAPIService(mockResponses: mockResponse)
        let repository = DefaultWeatherRepository(apiService: apiService)
        
        // When
        let locations = try await repository.searchLocations(query: "London", limit: 2)
        
        // Then
        #expect(locations.count == 2)
        #expect(locations[0].name == "London")
        #expect(locations[0].latitude == 51.5074)
        #expect(locations[0].longitude == -0.1278)
        #expect(locations[0].country == "GB")
        #expect(locations[0].state == nil)
    }
    
    @Test func testSearchLocationsEmpty() async throws {
        // Given
        let apiService = MockWeatherAPIService(mockResponses: [])
        let repository = DefaultWeatherRepository(apiService: apiService)
        
        // When
        let locations = try await repository.searchLocations(query: "NonExistent", limit: 5)
        
        // Then
        #expect(locations.isEmpty)
    }
    
    @Test func testSearchLocationsError() async {
        // Given
        let apiService = MockWeatherAPIService(shouldFail: true)
        let repository = DefaultWeatherRepository(apiService: apiService)
        
        // When/Then
        do {
            _ = try await repository.searchLocations(query: "Invalid", limit: 5)
            XCTFail("Expected error to be thrown")
        } catch {
            // Success - error was thrown as expected
        }
    }
} 