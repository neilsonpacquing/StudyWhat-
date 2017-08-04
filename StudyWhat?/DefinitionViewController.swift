//
//  DefinitionViewController.swift
//  StudyWhat?
//
//  Created by Neilson Pacquing on 8/3/17.
//  Copyright © 2017 Neilson Pacquing. All rights reserved.
//
//GOTTA MAKE IT EDITABLE AND BE ABLE TO BE SAVED WHEN THE CERTAIN TERM IS PRESSED.

import UIKit

class DefinitionViewController: UIViewController {

    @IBOutlet weak var termDefinition: UITextView!
    @IBOutlet weak var termLabel: UILabel!
    @IBAction func nextButton(_ sender: Any) {
        
    }
    @IBAction func backButton(_ sender: Any) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
