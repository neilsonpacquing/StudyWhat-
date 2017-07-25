//
//  ConfidenceSurveyTermsViewController.swift
//  StudyWhat?
//
//  Created by Neilson Pacquing on 7/17/17.
//  Copyright © 2017 Neilson Pacquing. All rights reserved.
//

import Foundation
import UIKit


class ConfidenceSurveyTopicsViewController: UITableViewController {
    
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "confidenceTopicCell", for: indexPath)
        print(indexPath.row)
        
        cell.textLabel?.text = currentSubject?.topics[indexPath.row].name
        return cell
        
    }
    // when clicked, it will perform the segway link and has a way back
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
  // this is your if else statement
        if navigationItem.title == "Confidence Survey Topic"
        {
            termToPass = currentSubject?.topics[indexPath.row].terms[indexPath.row].name
            performSegue(withIdentifier: "topicToTermSurvey", sender: self)
        }
//        else
//        {
//            performSegue(withIdentifier: "topicsToTerms", sender: nil)
//        }
        
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.delete){
            currentSubject?.topics.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "topicToTermSurvey"
        {
            let destinationController = segue.destination as! TermConfidenceSurveyViewController
            
            destinationController.terms = (currentSubject?.topics[(tableView.indexPathForSelectedRow?.row)!].terms)!
        } else {
            let nextTopicViewController = segue.destination as! MySubjectsTermsViewController
            let tappedTopic = currentSubject?.topics[(tableView.indexPathForSelectedRow?.row)!]
            
            nextTopicViewController.currentTopic = tappedTopic
        }
    }

}

    
//    var confidenceSurveyTopicsTableTestData: [String] = ["Good", "💩"]
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//    }
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return confidenceSurveyTopicsTableTestData.count
//    }
//    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "confidenceTopicCell", for: indexPath)
//        print(indexPath.row)
//        
//        cell.textLabel?.text = confidenceSurveyTopicsTableTestData[indexPath.row]
//        return cell
//        
//    }
//    // when clicked, it will perform the segway link and has a way back
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        performSegue(withIdentifier: "topicToTermSurvey", sender: nil)
//    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let nextTopicConfidenceViewController = segue.destination as! MySubjectsTermsViewController
//        //let tappedConfidenceTopic = currentSubject?.topics[(tableView.indexPathForSelectedRow?.row)!]
//        
//        //nextTopicViewController.currentTopic = tappedTopic
//    }
//}
