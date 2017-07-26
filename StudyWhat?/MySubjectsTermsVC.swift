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
    
    var currentTopic : Topic?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let termCountInTopic = (currentTopic?.terms.count){
            return termCountInTopic
        }
        else{
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "termTableViewCell", for: indexPath)
        print(indexPath.row)
        
        cell.textLabel?.text = currentTopic?.terms[indexPath.row].name
//       //new thing attempting to add
        cell.detailTextLabel?.text = dateAddTime[indexPath.row]
//
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
                let newTerm = Term(name: termStringToAddIntoTableView!)
                self.currentTopic?.terms.append(newTerm)
//                // new stuff trying to add
                let time = Date()
                let formatter = DateFormatter()
                //look up different ways to display date and time
                formatter.dateFormat = "MMM dd, yyyy (hh:mm)"
                let result = formatter.string(from: time)
                dateAddTime.append(result)
//                ////////////////////////////////
                self.tableView.reloadData()
                
            }
        }
        addTermAlert.addAction(cancelAction)
        addTermAlert.addAction(addAction)
        
        present(addTermAlert, animated: true, completion: nil)
    }
    
    

}

