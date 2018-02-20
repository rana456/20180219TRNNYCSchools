//
//  SchoolDetailViewModel.swift
//  20180219TRNNYCSchools
//
//  Created by ramu on 2/20/18.
//  Copyright © 2018 RamuNaidu Tumpala. All rights reserved.
//

import Foundation

class SchoolDetailViewModel {
    
    // Define an schoolDetail property that will hold the data
    //This array is marked an optional (?) because we might not get back data from the API

    var schoolDetail: SchoolDetail?

    private struct Constants {
        static let schoolDetails = "https://data.cityofnewyork.us/resource/734v-jeq5.json"
    }

    //This function is what directly accesses the APIRequest to make the API call
    func getDetailsOfSchool(school:SchoolElement, completion: @escaping () -> () ) {
        
        if let url = URL(string: Constants.schoolDetails+"?dbn=\(school.dbn)") {
            APIRequest(url: (url), type: SchoolDetailElement.self).getResponse { (schoolObj, error) in
                DispatchQueue.main.async {
                    if let schoolObj = schoolObj {
                        self.schoolDetail = schoolObj as? SchoolDetail
                        completion()
                    }
                }
            }
        }
    }

    func detailsOfSchool()-> String {
        if let detail = self.schoolDetail?.first {
            return "\(detail.schoolName)  \n \n \n \(ConstantString.satTestTakers) : \(detail.numOfSatTestTakers) \n \n \(ConstantString.criticalReadingAvgScore) : \(detail.satCriticalReadingAvgScore)"
        }
        return ""
    }
}
