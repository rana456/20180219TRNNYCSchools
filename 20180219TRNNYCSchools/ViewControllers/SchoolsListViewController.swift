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
    
    var viewModel: SchoolViewModel = SchoolViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = ConstantString.schoolListTitle
        // Do any additional setup after loading the view, typically from a nib.
        
        // Making TableviewCell Height as dynamic
        tableView.estimatedRowHeight = 44.0
        tableView.rowHeight = UITableViewAutomaticDimension
        
        SVProgressHUD.show()
        
        viewModel.getSchoolLists(completion: {() in
            self.tableView.reloadData()
            SVProgressHUD.dismiss()
        })
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      //When Navigating to SchoolDetailViewController passing SchoolElement Object
        let designationController = segue.destination as? SchoolDetailViewController
        if let cell = sender as? SchoolCell, let indexPath = tableView.indexPath(for: cell) {
            if let schoolObject = viewModel.schoolObject(for: indexPath) {
                designationController?.schoolObj = schoolObject
            }
        }
    }
   
}

extension SchoolsListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "SchoolListCell") as? SchoolCell {
            if let schoolObject = viewModel.schoolObject(for: indexPath) {
                cell.schoolNameLabel.text = schoolObject.schoolName
            }
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItemsToDisplay(in: section)
    }
}
