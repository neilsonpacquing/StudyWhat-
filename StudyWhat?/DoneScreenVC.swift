//
//  DoneScreen.swift
//  StudyWhat?
//
//  Created by Neilson Pacquing on 7/21/17.
//  Copyright © 2017 Neilson Pacquing. All rights reserved.
//

import UIKit

class DoneScreenViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var termsOnSurvey = [Term]()
    
    @IBOutlet weak var resultsTableView: UITableView!
    
    override func viewDidLoad() {
        print(termsOnSurvey.count)
        resultsTableView.delegate = self
        resultsTableView.dataSource = self
        
        resultsTableView.layer.borderWidth = 1
        resultsTableView.layer.borderColor = UIColor.lightGray.cgColor
        
        resultsTableView.layer.cornerRadius = 8
        resultsTableView.clipsToBounds = true
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return termsOnSurvey.count
    }
    //gets specific cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //make all cells likke this
        let cell = tableView.dequeueReusableCell(withIdentifier: "doneCell", for: indexPath)
        print(indexPath.row)
        
        cell.textLabel?.text = termsOnSurvey[indexPath.row].name
        return cell
        
    }
    
}
