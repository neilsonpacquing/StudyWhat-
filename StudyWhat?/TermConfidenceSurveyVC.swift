//
//  TermConfidenceSurvey.swift
//  StudyWhat?
//
//  Created by Neilson Pacquing on 7/20/17.
//  Copyright © 2017 Neilson Pacquing. All rights reserved.
//

import UIKit

class TermConfidenceSurveyViewController: UIViewController {
    
    
    var terms = [Term]()
    var index = 0
    var count = 0

    @IBAction func confidenceSlider(_ sender: UISlider) {
        Score.text = String(Int(sender.value))
        
    }
    //made the save button save the score from the confidence slider
    @IBAction func saveButton(_ sender: Any) {
        terms[index].confidenceScore = Int16(Int(confidenceSlider.value))
        scoreNumber.text = String(terms[index].confidenceScore)   //make save button act like the next button
        NextButton(self)
        CoreDataHelper.save()
        }
    
    @IBOutlet weak var confidenceSlider: UISlider!
    @IBOutlet weak var Score: UILabel!
    @IBOutlet weak var termLabel: UILabel!
    @IBOutlet weak var lastScore: UILabel!
    @IBOutlet weak var scoreNumber: UILabel!   //what I'm attempting to adjust
    //make an action for the buttons
    
    override func viewDidLoad() {
        super.viewDidLoad()
//updates score next time it is called
        if terms.count == 0 {
            return
        }
        scoreNumber.text = String(terms[index].confidenceScore)
        termLabel.text = terms[index].name
        Score.text = String(terms[index].confidenceScore)
        
    }
    // did this to update when view controller appears
    override func viewWillAppear(_ animated: Bool) {
        if terms.count == 0 {
            return
        }
        Score.text = String(terms[index].confidenceScore)
        confidenceSlider.value = Float(terms[index].confidenceScore)
    }
    //made it so that the next button will go to the next term, but if done, will go to resultsScreen
    @IBAction func NextButton(_ sender: Any) {
        if index == terms.count - 1 {
            //sender is what we are sending to viewcontroller
            performSegue(withIdentifier: "TermsToResultsScreen", sender: terms)
        } else {
            index += 1
            scoreNumber.text = String(terms[index].confidenceScore)

            termLabel.text = terms[index].name
            Score.text = String(terms[index].confidenceScore)
            
        //made slider equal the value you put it as in the past
            confidenceSlider.value = Float(terms[index].confidenceScore)
        }
    }
    //made it so the user cannot go back when on the first term but can on any other term
    @IBAction func BackTermButton(_ sender: Any) {
        if termLabel.text == terms[0].name {
            index = 0
        } else {
            index -= 1
            Score.text = String(terms[index].confidenceScore)
            scoreNumber.text = String(terms[index].confidenceScore)

        //make slider equal the value you put it as in the past
            confidenceSlider.value = Float(terms[index].confidenceScore)
        }
        termLabel.text = terms[index].name
    }
    
    //makes it go to resultsScreen when done with array
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "TermsToResultsScreen" {
            let destination = segue.destination as! ResultsScreenViewController
            let sendArray = sender as! [Term]
            destination.termsOnSurvey = sendArray
        }
    }
    
    
}
    
