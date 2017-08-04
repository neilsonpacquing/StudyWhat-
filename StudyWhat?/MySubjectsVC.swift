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
//var dateAddTime = [String]()



class MySubjectsViewController: UITableViewController {
    
    
    override func viewDidLoad() {
        //made nav controller bar color white such as the "+" button and the back button
        self.navigationController?.navigationBar.tintColor = .white
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    // viewWillAppear updates when view is going to appear
    override func viewWillAppear(_ animated: Bool) {
        subjectsTableData = CoreDataHelper.retrieveSubjects()
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
    //saves memory by reusing cells that go off screen
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "subjectTableViewCell", for: indexPath) as! SubjectTableViewCell
        print(indexPath.row)
//        //attempting to alternate colors for cells
//        if indexPath.row % 2 == 0 {
//            cell.backgroundColor = UIColor.white
//        }else{
//            cell.backgroundColor = UIColor.lightGray
//        }
        //for the subject label to be what you make it
        cell.subjectLabel?.text = subjectsTableData[indexPath.row].name
        //adding a String before displaying how many things are in the array within it.
        if let unwrappedTopics = subjectsTableData[indexPath.row].topics{
            cell.numberTopics?.text = "Topics: " + String(unwrappedTopics.count)
        }
        else{
            cell.numberTopics?.text = "Topics: 0"
        }
        
        
 //       //new thing attempting to add (for date and time when adding a new subject)
        //cell.detailTextLabel?.text = dateAddTime[indexPath.row]
 //
        return cell
    }

    // when clicked, it will perform the segway link and has a way back
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            performSegue(withIdentifier: "subjectsToTopics", sender: nil)
    }
    //made the slide to delete
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.delete){
            //deletes certain Subject in row.
            CoreDataHelper.delete(subject: subjectsTableData[indexPath.row])
            // need to remove count and take out the colored view
            //cell.numberTopics?.text = "Topics: " + String(unwrappedTopics.count -= 1)
            CoreDataHelper.save()
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
              //makes it so that if the textfield is empty, it will not display.
                if subjectAlertTextField.text == "" {
                    return
                }
                let subjectStringToAddIntoTableView = subjectAlertTextField.text
                
                let newSubject = CoreDataHelper.newSubject()
                newSubject.name = subjectStringToAddIntoTableView
                CoreDataHelper.save()
                //let newSubject = Subject(name: subjectStringToAddIntoTableView!)
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




