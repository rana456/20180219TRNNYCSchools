//
//  SchoolViewModel.swift
//  20180219TRNNYCSchools
//
//  Created by ramu on 2/19/18.
//  Copyright © 2018 RamuNaidu Tumpala. All rights reserved.
//

import Foundation

class SchoolViewModel {
    
    private struct Constants {
        static let schoolListsUrl = "https://data.cityofnewyork.us/resource/97mf-9njv.json"
    }
   // Define an school property that will hold the data
    //This array is marked an optional (?) because we might not get back data from the API

    var school: School?
    
    //This function is what directly accesses the APIRequest to make the API call
    func getSchoolLists(completion: @escaping () -> () ) {
        if let url = URL(string: Constants.schoolListsUrl) {
            APIRequest(url: url, type: SchoolElement.self).getResponse { (schoolObj, error) in
                if let schoolObj = schoolObj {
                    DispatchQueue.main.async {
                        self.school = schoolObj as? School
                        
                        //call our completion handler because it is in this completion that we will reload data in our view controller tableview
                        completion()
                    }
                }
            }
        }
    }
    
    
    // MARK: - values to display in our table view controller
    //9 -
    func numberOfItemsToDisplay(in section: Int) -> Int {
        return school?.count ?? 0
    }

    func schoolObject(for indexPath: IndexPath) -> SchoolElement? {
        return school?[indexPath.row] ?? nil
    }

}


