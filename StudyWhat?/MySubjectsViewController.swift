//
//  FirstViewController.swift
//  StudyWhat?
//
//  Created by Neilson Pacquing on 7/17/17.
//  Copyright © 2017 Neilson Pacquing. All rights reserved.
//

import UIKit

class MySubjectsViewController: UITableViewController {
    
    var subjectsTableTestData = [Subject]() //[String] = ["Add/Select Subject"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return subjectResults.count
        return subjectsTableTestData.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        print(indexPath.row)
        
        cell.textLabel?.text = subjectsTableTestData[indexPath.row].name
        return cell
    }

//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "subjectTableViewCell", for: indexPath)
//    
//        
//        cell.textLabel?.text = subjectResults[indexPath.row]
//        return cell
//        
//    }
    // when clicked, it will perform the segway link and has a way back
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    performSegue(withIdentifier: "subjectsToTopics", sender: nil)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.delete){
            subjectsTableTestData.remove(at: indexPath.row)
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
                
                let subjectStringToAddIntoTableView = subjectAlertTextField.text
                let newSubject = Subject(name: subjectStringToAddIntoTableView!)
                self.subjectsTableTestData.append(newSubject)
//                self.subjectsTableTestData.append(subjectStringToAddIntoTableView!)

                
                self.tableView.reloadData()
                
            }
            
        }
        addSubjectAlert.addAction(cancelAction)
        addSubjectAlert.addAction(addAction)
        //presents alert to the user
        present(addSubjectAlert, animated: true, completion: nil)
    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let nextViewController = segue.destination as! MySubjectsTopicsViewController
//        let tappedSubject = subjectsTableTestData[(tableView.indexPathForSelectedRow?.row)!]
//        
//        nextViewController.topicsTableTestData = tappedSubject.topicsTableTestData
//    }


}




