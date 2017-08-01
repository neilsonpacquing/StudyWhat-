//
//  MySubjectsViewController.swift
//  StudyWhat?
//
//  Created by Neilson Pacquing on 7/17/17.
//  Copyright © 2017 Neilson Pacquing. All rights reserved.
//


import UIKit

// made it global in attempt to call it from other function (BAD PRACTICE)
var subjectsTableData = [Subject]()
var dateAddTime = [String]()



class MySubjectsViewController: UITableViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    // viewWillAppear updates when view is going to appear
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // for specific cell and that term would be in each one
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subjectsTableData.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "subjectTableViewCell", for: indexPath) as! SubjectTableViewCell
        print(indexPath.row)
        
        
        cell.subjectLabel?.text = subjectsTableData[indexPath.row].name
        cell.numberTopics?.text = "Topics: " + String(subjectsTableData[indexPath.row].topics.count)
 //       //new thing attempting to add (for date and time when adding a new subject)
        //cell.detailTextLabel?.text = dateAddTime[indexPath.row]
 //
        return cell
    }

    // when clicked, it will perform the segway link and has a way back
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            performSegue(withIdentifier: "subjectsToTopics", sender: nil)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.delete){
            subjectsTableData.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    @IBAction func AddSubjectAlert(_ sender: Any) {
        //creating the alert
        let addSubjectAlert = UIAlertController(title: "Subject", message: "Enter New Subject Below", preferredStyle: UIAlertControllerStyle.alert)
        addSubjectAlert.addTextField { (subjectName:UITextField) in
            subjectName.placeholder = "Add New Subject Here"
        }
        //adds the add and cancel button on the alert
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel) { (result : UIAlertAction) -> Void in
        }
        
        let addAction = UIAlertAction(title: "Add", style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in
            
            if let subjectAlertTextField = addSubjectAlert.textFields?.first, subjectAlertTextField.text != nil {
                
                if subjectAlertTextField.text == "" {
                    return
                }
                let subjectStringToAddIntoTableView = subjectAlertTextField.text
                let newSubject = Subject(name: subjectStringToAddIntoTableView!)
                subjectsTableData.append(newSubject)
//                // new stuff trying to add (for date and time adding subject)
//                let time = Date()
//                let formatter = DateFormatter()
//                //look up different ways to display date and time
//                formatter.dateFormat = "MMM dd, yyyy  (hh:mm)"
//                let result = formatter.string(from: time)
//                dateAddTime.append(result)


//                ////////////////////////////////
                self.tableView.reloadData()
                
            }
            
        }
        addSubjectAlert.addAction(cancelAction)
        addSubjectAlert.addAction(addAction)
        //presents alert to the user
        present(addSubjectAlert, animated: true, completion: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextSubjectViewController = segue.destination as! MySubjectsTopicsViewController
        let tappedSubject = subjectsTableData[(tableView.indexPathForSelectedRow?.row)!]
        
        nextSubjectViewController.currentSubject = tappedSubject
        
    }


}




