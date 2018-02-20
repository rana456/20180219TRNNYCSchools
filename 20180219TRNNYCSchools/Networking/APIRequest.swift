//
//  APIRequest.swift
//  20180219TRNNYCSchools
//
//  Created by ramu on 2/19/18.
//  Copyright © 2018 RamuNaidu Tumpala. All rights reserved.
//

import Foundation

// - This APIRequest will be called by the viewModel to get School Data.

class APIRequest<T> {
    
    var url: URL
    var type: T.Type
    
    init(url: URL, type: T.Type) {
        self.url = url
        self.type = type
    }
    
    //- the completion handler will be executed after data is fetched
    // our completion handler will include an optional Object parsed from our retrieved JSON object

    func getResponse(responseHandler: @escaping (Any?, Error?) -> ()) {
        URLSession(configuration: URLSessionConfiguration.default).dataTask(with: url) { (data, response, error) in
            
            if let data = data,
                let response = response as? HTTPURLResponse,
                response.statusCode == 200 {
                responseHandler(self.getJSONFromData(data),error)
            }
          }.resume()
    }
    
    private func getJSONFromData(_ data: Data) -> Any? {
        
        do {
            var t: Any?
            if type == SchoolElement.self {
                t = try School(data: data)
            } else {
                t = try SchoolDetail(data: data)
            }
            return t
            
        } catch let parseError as NSError {
            print(parseError)
            return nil
        }

    }
}
