//
//  ResultsScreen.swift
//  StudyWhat?
//
//  Created by Neilson Pacquing on 7/21/17.
//  Copyright © 2017 Neilson Pacquing. All rights reserved.
//

import UIKit

class ResultsScreenViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var termsOnSurvey = [Term]()
    
    @IBOutlet weak var termAverageSurveyScoreCL: UILabel!  //trying to put average score in this label
    @IBOutlet weak var resultsTableView: UITableView!

    //made customizations to the tableview
    override func viewDidLoad() {
        print(termsOnSurvey.count)
        resultsTableView.delegate = self
        resultsTableView.dataSource = self
        
        resultsTableView.layer.borderWidth = 1
        resultsTableView.layer.borderColor = UIColor.lightGray.cgColor
        
        resultsTableView.layer.cornerRadius = 8         //made corners rounded
        resultsTableView.clipsToBounds = true
        
        calculateTermAverage()  //calling the function
    }
    // made this so its all grouped together so it's neater and easier to read
    func calculateTermAverage() {
        var total = 0
        for term in termsOnSurvey {
            total += term.confidenceScore
        }
        let average = Double(total) / Double(termsOnSurvey.count)
        //use 100 to round to 2 decimal places.
        let roundedAverage = Double(round(average * 100) / 100)
        termAverageSurveyScoreCL.text = String(roundedAverage)
    }
    
    
    //tableView stuff
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return termsOnSurvey.count
    }
    //for specific cell in tableview,
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //made it so whatever cells go offscreen will be used again to save memory
        let cell = tableView.dequeueReusableCell(withIdentifier: "resultCell", for: indexPath) as! ResultScreenTermCell
        print(indexPath.row)
        
        cell.termLabel.text = termsOnSurvey[indexPath.row].name
        cell.termScore.text = String(termsOnSurvey[indexPath.row].confidenceScore)
        return cell
        
    }
    
}
