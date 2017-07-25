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
    
    var confidenceSurveyTopicsTableTestData: [String] = ["Good", "💩"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return confidenceSurveyTopicsTableTestData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        print(indexPath.row)
        
        cell.textLabel?.text = confidenceSurveyTopicsTableTestData[indexPath.row]
        return cell
        
    }
    // when clicked, it will perform the segway link and has a way back
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "topicToTermSurvey", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextTopicConfidenceViewController = segue.destination as! MySubjectsTermsViewController
        //let tappedConfidenceTopic = currentSubject?.topics[(tableView.indexPathForSelectedRow?.row)!]
        
        //nextTopicViewController.currentTopic = tappedTopic
    }
}
