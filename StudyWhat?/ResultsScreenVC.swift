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
        termsOnSurvey.sort { (term1, term2) -> Bool in
            return term1.confidenceScore < term2.confidenceScore
        }
        
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
            total += Int(term.confidenceScore)
        }
        let average = Double(total) / Double(termsOnSurvey.count)
        //use 100 to round to 2 decimal places.
        let roundedAverage = Double(round(average * 1000) / 1000)
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
        //made it so that terms on survey 
        if termsOnSurvey[indexPath.row].confidenceScore >= 0 && termsOnSurvey[indexPath.row].confidenceScore <= 3 {
            cell.leftViewColor.backgroundColor = UIColor(red: 244/255, green: 89/255, blue: 81/255, alpha: 1)//red
        }
        if termsOnSurvey[indexPath.row].confidenceScore >= 4 && termsOnSurvey[indexPath.row].confidenceScore <= 7 {
            cell.leftViewColor.backgroundColor = UIColor(red: 255/255, green: 198/255, blue: 0/255, alpha: 1)//yellow
        }
        if termsOnSurvey[indexPath.row].confidenceScore >= 8 {
            cell.leftViewColor.backgroundColor = UIColor(red: 75/255, green: 184/255, blue: 84/255, alpha: 1)//green
        }
        return cell
        
    }
    
}
