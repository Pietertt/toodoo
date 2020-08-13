//
//  Activity.swift
//  toodoo
//
//  Created by Pieter Boersma on 13-08-20.
//  Copyright © 2020 Pieter Boersma. All rights reserved.
//

import Foundation
import os.log

class Activity: NSObject, NSCoding {

    //MARK Initialization
    
    init(title: String, date_from: String, date_to: String){
        self.title = title
        self.date_from = date_from
        self.date_to = date_to
    }
    
    //MARK: Properties
    
    var title: String
    var date_from: String
    var date_to: String
    
    //MARK: Archiving Paths
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("activities")
    
    //MARK: Types
    
    struct PropertyKey {
        static let title = "title"
        static let date_from = "date_from"
        static let date_to = "date_to"
    }
    
    //MARK: NSCoding
    
    func encode(with aCoder: NSCoder){
        aCoder.encode(title, forKey: PropertyKey.title)
        aCoder.encode(date_from, forKey: PropertyKey.date_from)
        aCoder.encode(date_to, forKey: PropertyKey.date_to)
    }
    
    required convenience init(coder aDecoder: NSCoder) {
        let title = aDecoder.decodeObject(forKey: PropertyKey.title) as! String
        let date_from = aDecoder.decodeObject(forKey: PropertyKey.date_from) as! String
        let date_to = aDecoder.decodeObject(forKey: PropertyKey.date_to) as! String
        
        self.init(title: title, date_from: date_from, date_to: date_to)
    }
}
