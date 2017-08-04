//
//  MyTopicsToTermsViewController.swift
//  StudyWhat?
//
//  Created by Neilson Pacquing on 7/17/17.
//  Copyright © 2017 Neilson Pacquing. All rights reserved.
//

//import Foundation
//import UIKit
//
//class MySubjectsTermsViewController: UITableViewController {
//    
//    var currentTopic : Topic?
//    var terms = [Term]()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }
//    
//    override func viewWillAppear(_ animated: Bool) {
//        terms = currentTopic?.terms?.allObjects as! [Term]
//    }
//
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "termsToPastStats"{
//            let destination = segue.destination as! PastStatsVC
//            destination.termsOnSurvey = terms
//        }
//    }
//    
//    
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if let termCountInTopic = (currentTopic?.terms?.count){
//            return termCountInTopic
//        }
//        else{
//            return 0
//        }
//    }
//    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "termTableViewCell", for: indexPath) as! TermTableViewCell
//        print(indexPath.row)
////This gotta be fixed too
//        cell.termLabel.text = terms[indexPath.row].name      //title
//       //new thing attempting to add (for date and time whenadding new term)
////        cell.detailTextLabel?.text = dateAddTime[indexPath.row]
//
//        return cell
//        
//    }
//    
//// new segue
//    // when clicked, it will perform the segway link and has a way back
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        performSegue(withIdentifier: "termsToPastStats", sender: currentTopic?.terms)
//    }
////
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
//        if (editingStyle == UITableViewCellEditingStyle.delete){
//            CoreDataHelper.delete(term: terms[indexPath.row])
//            terms.remove(at: indexPath.row)
//            currentTopic?.terms = NSSet(array: terms)
//            print(terms.count)
//            CoreDataHelper.save()
//            tableView.deleteRows(at: [indexPath], with: .fade)
//        }
//    }
//    
//    @IBAction func AddTermsAlert(_ sender: Any) {
//        let addTermAlert = UIAlertController(title: "Term", message: "Enter New Term Below", preferredStyle: UIAlertControllerStyle.alert)
//        addTermAlert.addTextField { (termName:UITextField) in
//            termName.placeholder = "Add New Term Here"
//        }
//        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel) { (result : UIAlertAction) -> Void in
//        }
//        let addAction = UIAlertAction(title: "Add", style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in
//            if let termAlertTextField = addTermAlert.textFields?.first, termAlertTextField.text != nil {
//                //makes it so that if the textField is empty, it will not display anything
//                if termAlertTextField.text == "" {
//                    return
//                }
//                
//                let termStringToAddIntoTableView = termAlertTextField.text
//                let newTerm = CoreDataHelper.newTerm()//Term(name: termStringToAddIntoTableView!)
//                newTerm.name = termStringToAddIntoTableView
//                self.terms.append(newTerm)
//                self.currentTopic?.terms = NSSet(array: self.terms)
//                CoreDataHelper.save()
//                // new stuff trying to add (for date and time when adding a new term)
////                let time = Date()
////                let formatter = DateFormatter()
////                //look up different ways to display date and time
////                formatter.dateFormat = "MMM dd, yyyy (hh:mm)"
////                let result = formatter.string(from: time)
////                dateAddTime.append(result)
//                self.tableView.reloadData()
//                
//            }
//        }
//        
//        addTermAlert.addAction(cancelAction)
//        addTermAlert.addAction(addAction)
//        
//        present(addTermAlert, animated: true, completion: nil)
//    }
//    
//    
//
//}
//
