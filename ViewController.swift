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
    @IBOutlet weak var fromField: UITextField!
    @IBOutlet weak var toField: UITextField!
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    //MARK: Properties
    
    var activity: Activity?

    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        navigationController?.navigationBar.tintColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00)
        
        if let activity = activity {
            self.titlefField.text = activity.title
            self.fromField.text = activity.date_from
            self.toField.text = activity.date_to
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

        let title = self.titlefField.text ?? ""
        let from = self.fromField.text ?? ""
        let to = self.toField.text ?? ""
        
        activity = Activity(title: title, date_from: from, date_to: to)
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

