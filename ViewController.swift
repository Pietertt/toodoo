//
//  ViewController.swift
//  toodoo
//
//  Created by Pieter Boersma on 13-08-20.
//  Copyright © 2020 Pieter Boersma. All rights reserved.
//

import UIKit
import os.log

class ViewController: UIViewController {
    @IBOutlet weak var titlefField: UITextField!
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    //MARK: Properties
    
    var activity: Activity?

    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    //MARK: Actions
    
    //MARK: Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        guard let button = sender as? UIBarButtonItem, button === saveButton else {
            os_log("The save button was not pressed, cancelling", log: OSLog.default, type: .debug)
            return
        }
        
        activity = Activity(title: "Hoi", date_from: "11:00", date_to: "13:00")
    }
}

