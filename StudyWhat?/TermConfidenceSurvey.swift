//
//  TermConfidenceSurvey.swift
//  StudyWhat?
//
//  Created by Neilson Pacquing on 7/20/17.
//  Copyright © 2017 Neilson Pacquing. All rights reserved.
//

import UIKit

class TermConfidenceSurveyTableView: UIViewController {
    
    var termString: String?
 
    @IBAction func confidenceSlider(_ sender: UISlider) {
        Score.text = String(Int(sender.value))
    }
    @IBOutlet weak var Save: UIButton!
    
    @IBOutlet weak var Score: UILabel!
    
    @IBOutlet weak var termLabel: UILabel!
    
//    @IBOutlet weak var Term: UILabel!
//    Term.text = String
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        if let temporaryTermString = termString
        {
            termLabel.text = temporaryTermString
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    
    
}
    
