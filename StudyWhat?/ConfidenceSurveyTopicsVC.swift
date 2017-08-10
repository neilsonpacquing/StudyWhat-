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
    var topics = [Topic]()
    
    var termToPass: String! = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = currentSubject?.name
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
        topics = currentSubject?.topics?.allObjects as! [Topic]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let theCount = currentSubject?.topics?.count{
            return theCount
        }
        else{
            return 0
        }
        
    }
    //
//    func calculateTermAverage() {
//        var total = 0
//        for term in termsOnSurvey {
//            total += term.confidenceScore
//        }
//        let average = Double(total) / Double(termsOnSurvey.count)
//        //use 100 to round to 2 decimal places.
//        let roundedAverage = Double(round(average * 100) / 100)
//        termAverageSurveyScoreCL.text = String(roundedAverage)
//    }
    //
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "confidenceTopicCell", for: indexPath) as! ConfidenceTopicCell
        print(indexPath.row)
        
        cell.confidenceTopicLabel.text = topics[indexPath.row].name
        if let unwrappedTerms = topics[indexPath.row].terms{
            cell.numberTerms.text = "Terms: " + String(unwrappedTerms.count)
        }else{
            cell.numberTerms.text = "Terms: 0"
        }
        //cell.confidenceTopicScore.text = String(currentSubject?.topics[indexPath.row].name
        return cell
        
    }
    // when clicked, it will perform the segway link and has a way back
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
// it doesn't go to the survey but just goes straight to this (count goes back to 0?)
        let clickedTopic = topics[indexPath.row]
        
        
        if clickedTopic.terms?.count == 0 {
//
            let alert = UIAlertController(title: "Empty!", message: "There are no terms in this topic!", preferredStyle: UIAlertControllerStyle.alert)
            let cancelAction = UIAlertAction(title: "Okay!", style: UIAlertActionStyle.cancel, handler: nil)
            alert.addAction(cancelAction)
            present(alert, animated: true, completion: nil)
            
            
        }else{
            
     
                //tableView.reloadData()
                //termToPass = currentSubject?.topics[indexPath.row].terms[indexPath.row].name
                performSegue(withIdentifier: "topicToTermSurvey", sender: self)
                
            
        }
    }
    
    
    
    
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
//        if (editingStyle == UITableViewCellEditingStyle.delete){
//            topics.remove(at: indexPath.row)
//            tableView.deleteRows(at: [indexPath], with: .fade)
//        }
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "topicToTermSurvey"
        {
            let destinationController = segue.destination as! TermConfidenceSurveyViewController
            
            destinationController.terms = (topics[(tableView.indexPathForSelectedRow?.row)!].terms)!.allObjects as! [Term]
//        } else {
//            let nextTopicViewController = segue.destination as! MySubjectsTermsViewController
//            let tappedTopic = topics[(tableView.indexPathForSelectedRow?.row)!]
//            
//            nextTopicViewController.currentTopic = tappedTopic
        }
        
    }

}
