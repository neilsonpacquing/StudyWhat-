//
//  MySubjectsToTopics.swift
//  StudyWhat?
//
//  Created by Neilson Pacquing on 7/17/17.
//  Copyright © 2017 Neilson Pacquing. All rights reserved.
//

import Foundation
import UIKit

class MySubjectsTopicsViewController: UITableViewController {
    
    //var topicsTableTestData : [Topic]? //: [String] = ["Add/Select Topic"]
    //make this class work with currentSubject.topics
    var currentSubject : Subject?
    
    
    var termToPass: String! = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let theCount = currentSubject?.topics.count{
            return theCount
        }
        else{
            return 0
        }
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "topicTableViewCell", for: indexPath)
        print(indexPath.row)
        
        cell.textLabel?.text = currentSubject?.topics[indexPath.row].name
        return cell
        
    }
//    // when clicked, it will perform the segway link and has a way back
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//       
    if navigationItem.title == "Topic" {
//        {
            termToPass = currentSubject?.topics[indexPath.row].terms[indexPath.row].name
//            performSegue(withIdentifier: "topicToTermSurvey", sender: self)
//        }
//        else
//        {
            performSegue(withIdentifier: "topicsToTerms", sender: nil)
    
//        }
//
        }
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.delete){
            currentSubject?.topics.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    @IBAction func AddTopicAlert(_ sender: Any) {
        let addTopicAlert = UIAlertController(title: "Topic", message: "Enter New Topic Below", preferredStyle: UIAlertControllerStyle.alert)
        addTopicAlert.addTextField { (topicName:UITextField) in
            topicName.placeholder = "Add New Topic Here"
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel) { (result : UIAlertAction) -> Void in
        }
        let addAction = UIAlertAction(title: "Add", style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in
            if let topicAlertTextField = addTopicAlert.textFields?.first, topicAlertTextField.text != nil {
                
                let topicStringToAddIntoTableView = topicAlertTextField.text
//                self.topicsTableTestData.append(topicStringToAddIntoTableView!)
                let newTopic = Topic(name: topicStringToAddIntoTableView!)
                self.currentSubject?.topics.append(newTopic)
                self.tableView.reloadData()
                
            }
        }
        addTopicAlert.addAction(cancelAction)
        addTopicAlert.addAction(addAction)
        
        present(addTopicAlert, animated: true, completion: nil)
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "topicToTerms"
        {
            let destinationController = segue.destination as! MySubjectsTermsViewController
            
            destinationController.currentTopic = (currentSubject?.topics[(tableView.indexPathForSelectedRow?.row)!])
        } else {
            let nextTopicViewController = segue.destination as! MySubjectsTermsViewController
            let tappedTopic = currentSubject?.topics[(tableView.indexPathForSelectedRow?.row)!]
            
            nextTopicViewController.currentTopic = tappedTopic
        }
    }


}
