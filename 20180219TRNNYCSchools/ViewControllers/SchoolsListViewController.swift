//
//  SchoolsListViewController.swift
//  20180219TRNNYCSchools
//
//  Created by ramu on 2/19/18.
//  Copyright © 2018 RamuNaidu Tumpala. All rights reserved.
//

import Foundation
import UIKit
import SVProgressHUD

class SchoolsListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var school: School = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = ConstantString.schoolListTitle
        // Do any additional setup after loading the view, typically from a nib.
        tableView.estimatedRowHeight = 44.0
        tableView.rowHeight = UITableViewAutomaticDimension
        SVProgressHUD.show()
        SchoolViewModel().getSchoolLists(completion: { [unowned self] (s) in
            let strongSelf = self
            strongSelf.school = s
            DispatchQueue.main.async {
                self.tableView.reloadData()
                SVProgressHUD.dismiss()
            }
        })
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      
        let designationController = segue.destination as? SchoolDetailViewController
        if let cell = sender as? SchoolCell, let indexPath = tableView.indexPath(for: cell) {
            designationController?.schoolObj = school[indexPath.row]
        }
    }
   
}

extension SchoolsListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "SchoolListCell") as? SchoolCell {
            let schoolObject = school[indexPath.row]
            cell.schoolNameLabel.text = schoolObject.schoolName
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return school.count
    }
}
