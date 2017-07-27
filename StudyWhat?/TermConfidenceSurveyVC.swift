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
 
    @IBAction func confidenceSlider(_ sender: UISlider) {
        Score.text = String(Int(sender.value))
        //lastScore.text = String(Int(sender.value))
        
    }

    @IBAction func saveButton(_ sender: Any) {
        terms[index].confidenceScore = Int(confidenceSlider.value)
    }
    
    @IBOutlet weak var confidenceSlider: UISlider!
    @IBOutlet weak var Score: UILabel!
    @IBOutlet weak var termLabel: UILabel!
    @IBOutlet weak var lastScore: UILabel!
    //make an action for the buttons
    //when the forward arrow ispressed it should increase index by 1 and show the term at that index
    //Notice that when index gets to terms.count we wont want them to be able to keep pressing that button
    //update the term label's text to show the term in the terms array at the current index
    override func viewDidLoad() {
        
        super.viewDidLoad()
        termLabel.text = terms[index].name
        Score.text = String(terms[index].confidenceScore)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        Score.text = String(terms[index].confidenceScore)
        confidenceSlider.value = Float(terms[index].confidenceScore)
    }
    
    @IBAction func NextButton(_ sender: Any) {
        if index == terms.count - 1 {
            //sender is what we are sending to viewcontroller
            performSegue(withIdentifier: "TermsToDoneScreen", sender: terms)
        } else {
            index += 1
            termLabel.text = terms[index].name
            Score.text = String(terms[index].confidenceScore)
        //made slider equal the value you put it as in the past
            confidenceSlider.value = Float(terms[index].confidenceScore)
        }
    }
    
    @IBAction func BackTermButton(_ sender: Any) {
        if termLabel.text == terms[0].name {
            index = 0
        } else {
            index -= 1
            Score.text = String(terms[index].confidenceScore)
        //make slider equal the value you put it as in the past
            confidenceSlider.value = Float(terms[index].confidenceScore)
        }
        termLabel.text = terms[index].name
    }
    
    //makes it perform the certain segue at a certain time
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "TermsToDoneScreen" {
            let destination = segue.destination as! DoneScreenViewController
            let sendArray = sender as! [Term]
            destination.termsOnSurvey = sendArray
        }
    }
    
}
    
