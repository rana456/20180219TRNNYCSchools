//
//  SchoolViewModel.swift
//  20180219TRNNYCSchools
//
//  Created by ramu on 2/19/18.
//  Copyright © 2018 RamuNaidu Tumpala. All rights reserved.
//

import Foundation

struct SchoolViewModel {
    
    private struct Constants {
        static let schoolListsUrl = "https://data.cityofnewyork.us/resource/97mf-9njv.json"
        static let schoolDetails = "https://data.cityofnewyork.us/resource/734v-jeq5.json"
    }
    
    func getSchoolLists(completion: @escaping (School) -> () ) {
        if let url = URL(string: Constants.schoolListsUrl) {
            APIRequest(url: url, type: SchoolElement.self).getResponse { (schoolObj, error) in
                if let schoolObj = schoolObj {
                    completion(schoolObj as! School)
                }
            }
        }
    }
    
    func getDetailsOfSchool(school:SchoolElement, completion: @escaping (SchoolDetail) -> () ) {
        
        if let url = URL(string: Constants.schoolDetails+"?dbn=\(school.dbn)") {
            APIRequest(url: (url), type: SchoolDetailElement.self).getResponse { (schoolObj, error) in
                if let schoolObj = schoolObj {
                    completion(schoolObj as! SchoolDetail)
                }
            }
        }
    }
    
}
