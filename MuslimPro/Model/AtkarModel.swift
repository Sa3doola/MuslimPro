//
//  AtkarModel.swift
//  MuslimPro
//
//  Created by Saad Sherif on 7/15/21.
//

import Foundation

struct Results: Codable {
    let results: [Result]
}

struct Result: Codable {
    let category: String
    let count: Int
    let description: String?
    let reference: String?
    let zekr: String
}


