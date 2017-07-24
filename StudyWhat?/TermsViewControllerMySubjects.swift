//
//  MyTopicsToTermsViewController.swift
//  StudyWhat?
//
//  Created by Neilson Pacquing on 7/17/17.
//  Copyright © 2017 Neilson Pacquing. All rights reserved.
//

import Foundation
import UIKit

class MySubjectsTermsViewController: UITableViewController {
    
    //var termsTableTestData = [Term]() //: [String] = ["Add/Select Term"]
    var currentTopic : Topic?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (currentTopic?.terms.count)!
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        print(indexPath.row)
        
        cell.textLabel?.text = currentTopic?.terms[indexPath.row].name
        return cell
        
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.delete){
            currentTopic?.terms.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    @IBAction func AddTermsAlert(_ sender: Any) {
        let addTermAlert = UIAlertController(title: "Term", message: "Enter New Term Below", preferredStyle: UIAlertControllerStyle.alert)
        addTermAlert.addTextField { (termName:UITextField) in
            termName.placeholder = "Add New Term Here"
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel) { (result : UIAlertAction) -> Void in
        }
        let addAction = UIAlertAction(title: "Add", style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in
            if let termAlertTextField = addTermAlert.textFields?.first, termAlertTextField.text != nil {
                
                let termStringToAddIntoTableView = termAlertTextField.text
//                self.termsTableTestData.append(termStringToAddIntoTableView!)
                let newTerm = Term(name: termStringToAddIntoTableView!)
                self.currentTopic?.terms.append(newTerm)
                self.tableView.reloadData()
                
            }
        }
        addTermAlert.addAction(cancelAction)
        addTermAlert.addAction(addAction)
        
        present(addTermAlert, animated: true, completion: nil)
    }
    
    

}

