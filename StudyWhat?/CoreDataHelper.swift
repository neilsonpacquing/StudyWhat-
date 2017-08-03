//
//  CoreDataHelper.swift
//  StudyWhat?
//
//  Created by Neilson Pacquing on 8/1/17.
//  Copyright © 2017 Neilson Pacquing. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class CoreDataHelper {  //provides automated and generalized solutions to common tasks, saves code
    
    static let appDelegate = UIApplication.shared.delegate as! AppDelegate
    static let persistentContainer = appDelegate.persistentContainer
    static let managedContext = persistentContainer.viewContext
    
    static func save() {        //(saves certain object to the default core data)
        do {
            try managedContext.save()
             //catches the error while trying to save
        } catch let error as NSError {
            print("Could not save \(error)")
        }
    }
////took this part from notes 
//    static func delete(note: Any) {  //(accepts an object as its one parameter deletes that certain object from the default CoreData)
//        managedContext.delete(note)
//        save()
//    }

    
    static func delete(subject: Subject) {  //(accepts an object as its one parameter deletes that certain object from the default CoreData)
        managedContext.delete(subject)
        save()
    }
    
    static func delete(topic: Topic) {  //(accepts an object as its one parameter deletes that certain object from the default CoreData)
        managedContext.delete(topic)
        save()
    }
    static func delete(term: Term) {  //(accepts an object as its one parameter deletes that certain object from the default CoreData)
        managedContext.delete(term)
        save()
    }
    

    //SUBJECT
    //static methods will go here   (methods thatcan be called directly on the class)
    static func newSubject() -> Subject {     //(create Subject object and returns it)
        print(managedContext)
        let subject = NSEntityDescription.insertNewObject(forEntityName: "Subject", into: managedContext) as! Subject
        return subject
    }
    
    static func retrieveSubjects() -> [Subject] {     //(retrieves all Subjects from the default CoreData)
        let fetchRequest = NSFetchRequest<Subject>(entityName: "Subject")
        do {
            let results = try managedContext.fetch(fetchRequest)
            return results
        } catch let error as NSError {
            print("Could not fetch \(error)")
        }
        return []
    }
    //TOPIC
    static func newTopic() -> Topic {     //(create topic object and returns it)
        let topic = NSEntityDescription.insertNewObject(forEntityName: "Topic", into: managedContext) as! Topic
        return topic
    }
    
    
    
    
    static func retrieveTopics() -> [Topic] {     //(retrieves all topics from the default CoreData)
        let fetchRequest = NSFetchRequest<Topic>(entityName: "Topic")
        do {
            let results = try managedContext.fetch(fetchRequest)
            return results
        } catch let error as NSError {
            print("Could not fetch \(error)")
        }
        return []
    }
    //TERM
    static func newTerm() -> Term {     //(create term object and returns it)
        let term = NSEntityDescription.insertNewObject(forEntityName: "Term", into: managedContext) as! Term
        return term
    }
    
    
    
    static func retrieveTerms() -> [Term] {     //(retrieves all terms from the default CoreData)
        let fetchRequest = NSFetchRequest<Term>(entityName: "Term")
        do {
            let results = try managedContext.fetch(fetchRequest)
            return results
        } catch let error as NSError {
            print("Could not fetch \(error)")
        }
        return []
    }


}
