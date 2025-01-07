//
//  WeatherAPIService.swift
//  WeatherInfo
//
//  Created by Alok Choudhary on 1/6/25.
//

import Foundation
import SwiftyNet


// MARK: - APIService
class WeatherAPIService1 {
    private let httpClient: HTTPClientProtocol

    init(httpClient: HTTPClientProtocol = HTTPClient(
        cacheManager: CacheManager(),
        networkMonitor: NetworkMonitor()
    )) {
        self.httpClient = httpClient
    }

    /// Fetch coordinates for a city
    func fetchCoordinates(for city: String, limit: Int = 5) async throws -> [GeocodingResponse] {
        try await httpClient.sendRequest(
            WeatherEndpoint.geocoding(city: city, limit: limit).endpoint,
            responseType: [GeocodingResponse].self
        )
    }
}
