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
    

    var currentSubject : Subject?
    var topics = [Topic]() //makes empty array of topics
    
    
    var termToPass: String! = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
        topics = currentSubject?.topics?.allObjects as! [Topic]
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return topics.count

        
    }
    //
    //saves memory by reusing cells that go off screen
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "topicTableViewCell", for: indexPath) as! TopicTableViewCell
        print(indexPath.row)
//currentSubject has an array of topics within it which is what we are trying to access
        cell.topicLabel.text = topics[indexPath.row].name //title
        
        //made a set take place of the array
        if let unwrappedTerms = topics[indexPath.row].terms{
            cell.numberOfTerms.text = "Terms: " + String(unwrappedTerms.count) //subtitle

        }else{
            cell.numberOfTerms.text = "Terms: 0" 
        }
        
//       //new thing attempting to add (for date and time for adding new topic)
        //cell.detailTextLabel?.text = dateAddTime[indexPath.row]
//
        return cell
        
    }
//    // when clicked, it will perform the segway link and has a way back
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
    if navigationItem.title == "Topic" {

            //termToPass = topics[indexPath.row].terms[indexPath.row].name
            performSegue(withIdentifier: "topicsToTerms", sender: nil)
        }
    }
    //made it so that you can slide to delete
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.delete){
            CoreDataHelper.delete(topic: topics[indexPath.row])
            topics.remove(at: indexPath.row)
            currentSubject?.topics = NSSet(array: topics)
            CoreDataHelper.save()

            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    //created an alert when adding a new topic with an add and cancel button
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
 //               //makes it so that if the textField is empty, it will not display
                if topicStringToAddIntoTableView == ""{
                    return
                    
                }
                
                let newTopic = CoreDataHelper.newTopic()
                newTopic.name = topicStringToAddIntoTableView
                self.topics.append(newTopic)
                self.currentSubject?.topics = NSSet(array: self.topics)
                CoreDataHelper.save()

//                // new stuff trying to add (for date and time when adding a new topic)
//                let time = Date()
//                let formatter = DateFormatter()
//                //look up different ways to display date and time
//                formatter.dateFormat = "MMM dd, yyyy (hh:mm)"
//                let result = formatter.string(from: time)
//                dateAddTime.append(result)
                
                
//                ////////////////////////////////
                self.tableView.reloadData()
                
            }
        }
        addTopicAlert.addAction(cancelAction)
        addTopicAlert.addAction(addAction)
        //presents alert to user
        present(addTopicAlert, animated: true, completion: nil)
        
    }
//made it so it performs the named segue 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "topicsToTerms"
        {
            let destinationController = segue.destination as! PastStatsVC
            
            destinationController.termsOnSurvey = (topics[(tableView.indexPathForSelectedRow?.row)!].terms?.allObjects as! [Term])
            for aTerm in destinationController.termsOnSurvey{
                print(aTerm.name)
            }
            destinationController.currentTopic = topics[(tableView.indexPathForSelectedRow?.row)!]
            print(destinationController.currentTopic?.name)
            print(destinationController.currentTopic?.terms?.count)
        }
    }


}
