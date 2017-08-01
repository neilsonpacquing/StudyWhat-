//
//  PastStatsVC.swift
//  StudyWhat?
//
//  Created by Neilson Pacquing on 7/29/17.
//  Copyright © 2017 Neilson Pacquing. All rights reserved.
//

import UIKit

class PastStatsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var termsOnSurvey = [Term]()
    
    @IBOutlet weak var pastStatsTableView: UITableView!

    @IBOutlet weak var pastTermAverageScoreCL: UILabel!
//    @IBAction func pastStatsToCSS(_ sender: Any) {
//        performSegue(withIdentifier: "pastStatsToCSS", sender: nil)
    @IBAction func pastStatsToSurvey(_ sender: UIButton) {
        performSegue(withIdentifier: "pastStatsToSurvey", sender: nil)
    }
//    }
    
    override func viewDidLoad() {
//        super.viewDidLoad()
//        tableView.estimatedRowHeight = tableView.rowHeight
//        tableView.rowHeight = UITableViewAutomaticDimension

        print(termsOnSurvey.count)
        pastStatsTableView.delegate = self
        pastStatsTableView.dataSource = self
            
        pastStatsTableView.layer.borderWidth = 1
        pastStatsTableView.layer.borderColor = UIColor.lightGray.cgColor
            
        pastStatsTableView.layer.cornerRadius = 8         //made corners rounded
        pastStatsTableView.clipsToBounds = true
        calculateTermAverage()
    }
    func calculateTermAverage() {
        var total = 0
        for term in termsOnSurvey {
            total += term.confidenceScore
        }
        let average = Double(total) / Double(termsOnSurvey.count)
        //use 100 to round to 2 decimal places.
        let roundedAverage = Double(round(average * 100) / 100)
        pastTermAverageScoreCL.text = String(roundedAverage)
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//  attempting to fetch the old data put in the results view controller and if its empty, score and average should be set to 0
    
    //tableView stuff
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return termsOnSurvey.count
    }
    //for specific cell in tableview,
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //made it so whatever cells go offscreen will be used again to save memory
    //
        let cell = tableView.dequeueReusableCell(withIdentifier: "pastTableViewCell", for: indexPath) as! PastStatsTableViewCell
        
        cell.termLabel.text = termsOnSurvey[indexPath.row].name
        cell.termScore.text = String(termsOnSurvey[indexPath.row].confidenceScore)
        print(termsOnSurvey[indexPath.row].confidenceScore)

        cell.selectionStyle = .none
        return cell
    //
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "pastStatsToSurvey"
        {
            let destinationController = segue.destination as! TermConfidenceSurveyViewController
            
            destinationController.terms = termsOnSurvey
        }
    }


    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

