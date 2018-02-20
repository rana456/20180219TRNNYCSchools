//
//  SchoolViewModel.swift
//  20180219TRNNYCSchools
//
//  Created by ramu on 2/19/18.
//  Copyright © 2018 RamuNaidu Tumpala. All rights reserved.
//


import Foundation


typealias School = [SchoolElement]

struct SchoolElement: Codable {
    let dbn: String
    let schoolName: String
    enum CodingKeys: String, CodingKey {
        case schoolName = "school_name"
        case dbn = "dbn"

    }
}

extension Array where Element == School.Element {
    init(data: Data) throws {
        self = try JSONDecoder().decode(School.self, from: data)
    }
}

