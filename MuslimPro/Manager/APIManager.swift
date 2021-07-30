//
//  APIManager.swift
//  MuslimPro
//
//  Created by Saad Sherif on 7/28/21.
//

import UIKit
import CoreLocation

/**
  Get Calendar of specific month form  api.aladhan.com
 
 - parameter latitude: Double --> latitude of current location
 - parameter longitude: Double --> longitude of current location
 - parameter method: Int = 5  "Egyptian General Authority of Survey "
 - parameter month: current month
 - parameter year: current year
 
 */

// "https://api.aladhan.com/v1/calendar?latitude=31.1341&longitude=-30.6460&method=5&month=7&year=2021"

class APIManager {
    
    struct Constants {
        static let baseAPIURL = "https://api.aladhan.com/v1/calendar?"
    }
    
    enum APIError: Error {
        case failedToGetData
    }
    
    static let shared = APIManager()
    
    public func getPrayerTime(lat: CLLocationDegrees, lon: CLLocationDegrees, completion: @escaping (Result<PrayerTimeModel, Error>) -> Void) {
        let currentMonth = Date().currentMonth()
        let currentYear = Date().currentYear()
        let urlString = "\(Constants.baseAPIURL)latitude=\(lat)&longitude=\(lon)&method=5&month=\(currentMonth)&year=\(currentYear)"
        fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    /**
      Fetch Generic JSON Data for any Model
     
     - parameter urlString: String --> URL
     
     - Completion Result: Model, Error
     
     */
    
    func fetchGenericJSONData<Model: Codable>(urlString: String, completion: @escaping (Result<Model, Error>) -> Void) {
        
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { (data, _, error) in
            
            guard let data = data, error == nil else {
                completion(.failure(APIError.failedToGetData))
                return
            }
            
            do {
                let model = try JSONDecoder().decode(Model.self, from: data)
                completion(.success(model))
            } catch {
                print(error.localizedDescription)
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
