//
//  Classes.swift
//  StudyWhat?
//
//  Created by Neilson Pacquing on 7/20/17.
//  Copyright © 2017 Neilson Pacquing. All rights reserved.
//
import Foundation

struct Subject{
    var name: String
    var topics = [Topic]()
    var terms = [Term]()
    
    init (name: String){
        self.name = name
    }
}

struct Topic{
    var name : String
    var terms = [Term]()
    
    init(name: String){
        self.name = name
    }
}
struct Term{
    var name: String
    
    init(name: String){
        self.name = name
    }
}
