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
    }
    @IBOutlet weak var Save: UIButton!
    
    @IBOutlet weak var Score: UILabel!
    
    @IBOutlet weak var termLabel: UILabel!
    
    
//    @IBOutlet weak var Term: UILabel!
//    Term.text = String

    //make an action for the buttons
    //when the forward arrow ispressed it should increase index by 1 and show the term at that index
    //Notice that when index gets to terms.count we wont want them to be able to keep pressing that button
    //update the term label's text to show the term in the terms array at the current index
    override func viewDidLoad() {
        
        super.viewDidLoad()
        termLabel.text = terms[0].name
        
    }
    
    @IBAction func NextButton(_ sender: Any) {
        if index == terms.count - 1 {
            performSegue(withIdentifier: "TermsToDoneScreen", sender: nil)
        }
        else {
            index += 1
            termLabel.text = terms[index].name
        }
        
        //termLabel.text = terms[1].name
        
    }
    
    @IBAction func BackTermButton(_ sender: Any) {
        index -= 1
        termLabel.text = terms[index].name
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
}
    
