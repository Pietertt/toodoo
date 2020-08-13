//
//  ViewController.swift
//  toodoo
//
//  Created by Pieter Boersma on 13-08-20.
//  Copyright © 2020 Pieter Boersma. All rights reserved.
//

import UIKit
import os.log

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var titlefField: UITextField!
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    //MARK: Properties
    
    var activity: Activity?

    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if let activity = activity {
            self.titlefField.text = activity.title
        }
    }

    //MARK: Actions
    
    //MARK: Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        guard let button = sender as? UIBarButtonItem, button === saveButton else {
            os_log("The save button was not pressed, cancelling", log: OSLog.default, type: .debug)
            return
        }

        let title = titlefField.text ?? ""
        
        activity = Activity(title: title, date_from: "11:00", date_to: "13:00")
    }
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        let isPresentingInAddActivityMode = presentingViewController is UINavigationController
        
        if isPresentingInAddActivityMode {
            dismiss(animated: true, completion: nil)
        }
        
        else if let owningNavigationController = navigationController {
            owningNavigationController.popViewController(animated: true)
        }
        else {
            fatalError("Oopsie")
        }
    }
    
    

    //MARK: UITextFieldDelegate

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            return true
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        saveButton.isEnabled = false
    }
}

