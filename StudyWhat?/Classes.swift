//
//  Classes.swift
//  StudyWhat?
//
//  Created by Neilson Pacquing on 7/20/17.
//  Copyright © 2017 Neilson Pacquing. All rights reserved.
//
import Foundation

class Subject{
    var name: String
    var topics = [Topic]()
    var terms = [Term]()
    //attempt
    var modificationTime = Date()
    //
    
    init (name: String){
        self.name = name
    }
}

class Topic{
    var name : String
    var terms = [Term]()
    //attempt
    var modificationTime = Date()
    //
    
    init(name: String){
        self.name = name
    }
}
class Term{
    var name: String
    //atttempt
    var modificationTime = Date()
    //
    
    var confidenceRating = 0
    init(name: String){
        self.name = name
    }
}
