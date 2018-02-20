//
//  SchoolDetailModel.swift
//  20180219TRNNYCSchools
//
//  Created by ramu on 2/19/18.
//  Copyright © 2018 RamuNaidu Tumpala. All rights reserved.
//

import Foundation

typealias SchoolDetail = [SchoolDetailElement]

struct SchoolDetailElement: Codable {
    let dbn: String
    let numOfSatTestTakers: String
    let satCriticalReadingAvgScore: String
    let satMathAvgScore: String
    let satWritingAvgScore: String
    let schoolName: String
    
    enum CodingKeys: String, CodingKey {
        case dbn = "dbn"
        case numOfSatTestTakers = "num_of_sat_test_takers"
        case satCriticalReadingAvgScore = "sat_critical_reading_avg_score"
        case satMathAvgScore = "sat_math_avg_score"
        case satWritingAvgScore = "sat_writing_avg_score"
        case schoolName = "school_name"
    }
}

extension Array where Element == SchoolDetail.Element {
    init(data: Data) throws {
        self = try JSONDecoder().decode(SchoolDetail.self, from: data)
    }
}
