//
//  SecondViewController.swift
//  StudyWhat?
//
//  Created by Neilson Pacquing on 7/17/17.
//  Copyright © 2017 Neilson Pacquing. All rights reserved.
//

import UIKit

class ConfidenceSurveyTableViewController: UITableViewController {
    
    //var confidenceTableTestData: [String] = ["BRUH","YOU","ARE","DOING","GREAT"]
    //var confidenceSurveySubject = [Subject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subjectsTableData.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        print(indexPath.row)
        
        cell.textLabel?.text = subjectsTableData[indexPath.row].name
        return cell
    }
    // when clikced, it will perform the segway link and has a way back
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "subjectConfidenceToTopics", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextSubjectConfidenceViewController = segue.destination as! MySubjectsTopicsViewController
        let tappedConfidenceSubject = subjectsTableData[(tableView.indexPathForSelectedRow?.row)!]
        
        nextSubjectConfidenceViewController.currentSubject = tappedConfidenceSubject
    }
    

}



