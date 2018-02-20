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
    var viewModel: SchoolDetailViewModel = SchoolDetailViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        if let school = schoolObj {
            self.detailLabel.text = school.schoolName
            SVProgressHUD.show()
            viewModel.getDetailsOfSchool(school: school) { () in
                self.detailLabel.text = self.viewModel.detailsOfSchool()
                SVProgressHUD.dismiss()
            }
        }
    }
}
