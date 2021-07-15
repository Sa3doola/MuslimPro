//
//  Bundle-Decodable.swift
//  MuslimPro
//
//  Created by Saad Sherif on 7/15/21.
//

import UIKit

extension Bundle {
    
    func decode<T: Codable>(_ type: T.Type, from file: String) -> T {
        guard let url = url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) in bundle.")
        }
        
        let decoder = JSONDecoder()
        
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to load \(file) in bundle.")
        }
        
        return loaded
    }
    
}
