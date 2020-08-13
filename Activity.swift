//
//  Activity.swift
//  toodoo
//
//  Created by Pieter Boersma on 13-08-20.
//  Copyright © 2020 Pieter Boersma. All rights reserved.
//

import Foundation

class Activity {
    
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
}
