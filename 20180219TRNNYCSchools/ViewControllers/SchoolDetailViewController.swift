//
//  SchoolDetailViewController.swift
//  20180219TRNNYCSchools
//
//  Created by ramu on 2/19/18.
//  Copyright © 2018 RamuNaidu Tumpala. All rights reserved.
//

import UIKit
import SVProgressHUD

class SchoolDetailViewController: UIViewController {
    
    var schoolObj: SchoolElement?
    @IBOutlet weak var detailLabel:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let school = schoolObj {
            self.detailLabel.text = school.schoolName
            SVProgressHUD.show()
            SchoolViewModel().getDetailsOfSchool(school: school) { (details) in
                DispatchQueue.main.async {
                    if let detail = details.first {
                        self.detailLabel.text = "  \(detail.schoolName)  \n \n \n \(ConstantString.satTestTakers) : \(detail.numOfSatTestTakers) \n \n \(ConstantString.criticalReadingAvgScore) : \(detail.satCriticalReadingAvgScore)"
                    }
                    SVProgressHUD.dismiss()
                }
            }
        }
    }
}
