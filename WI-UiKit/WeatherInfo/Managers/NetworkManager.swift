//
//  NetworkManager.swift
//  WeatherInfo
//
//  Created by Alok Choudhary on 6/30/18.
//  Copyright © 2018 Mt Aden LLC. All rights reserved.
//

import Foundation
import Alamofire

protocol NetworkManagerDelegate: class {
    func dataReceived(data: Any?, error: NSError?)
}

class NetworkManager: NSObject {
    let baseURLString: String = "https://api.darksky.net/forecast/"
    var baseURLWithAPIKeyString: String
    weak var delegate: NetworkManagerDelegate?
    
    init(apiKey: String) {
        self.baseURLWithAPIKeyString = "\(self.baseURLString)\(apiKey)/"
        
        super.init()
    }
    
    func getWeatherForCoordinate(coordinate: String) {
        let requestURL: String = "\(baseURLWithAPIKeyString)\(coordinate)"
        Alamofire.request(requestURL).responseJSON { (response) in
            switch response.result {
            case .success:
                guard let json = response.result.value else {
                    return
                }
                self.delegate?.dataReceived(data: json, error: nil)
            case .failure(let error):
                self.delegate?.dataReceived(data: nil, error: error as NSError)
            }
        }
    }
}
