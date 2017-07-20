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
    
    var topicsTableTestData = [Topic]() //: [String] = ["Add/Select Topic"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topicsTableTestData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        print(indexPath.row)
        
        cell.textLabel?.text = topicsTableTestData[indexPath.row].name
        return cell
        
    }
    // when clicked, it will perform the segway link and has a way back
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "topicsToTerms", sender: nil)
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.delete){
            topicsTableTestData.remove(at: indexPath.row)
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
                self.topicsTableTestData.append(newTopic)
                self.tableView.reloadData()
                
            }
        }
        addTopicAlert.addAction(cancelAction)
        addTopicAlert.addAction(addAction)
        
        present(addTopicAlert, animated: true, completion: nil)
        
    }
    
}
