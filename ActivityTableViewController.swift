//
//  ActivityTableViewController.swift
//  toodoo
//
//  Created by Pieter Boersma on 13-08-20.
//  Copyright © 2020 Pieter Boersma. All rights reserved.
//

import UIKit
import os.log

class ActivityTableViewController: UITableViewController {
    //MARK: Properties
    
    var activities = [Activity]()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.loadSampleActivities()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.activities.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "activityCell", for: indexPath) as? ActivityTableViewCell else {
            fatalError("Wrong oops")
        }
        
        let activity = self.activities[indexPath.row]
        
        cell.titleLabel.text = activity.title

        // Configure the cell...

        return cell
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        switch(segue.identifier ?? ""){
        case "AddItem":
            os_log("Adding a new activity", log: OSLog.default, type: .debug)
        case "ShowDetail":
        
        guard let viewController = segue.destination as? ViewController else {
            fatalError("Oopsie")
        }
        
        guard let selectedActivityCell = sender as? ActivityTableViewCell else {
            fatalError("Oopsie")
        }
        
        guard let indexPath = tableView.indexPath(for: selectedActivityCell) else {
            fatalError("Oopsie")
        }
        
        let selectedActivity = activities[indexPath.row]
        viewController.activity = selectedActivity
        
        default:
        fatalError("Oopsie")
        }
    }
    
    
    //MARK: Private methods
    
    private func loadSampleActivities(){
        var activity1 = Activity(title: "Test", date_from: "11:00", date_to: "13:00")
        
        var activity2 = Activity(title: "Test", date_from: "11:00", date_to: "13:00")
        
        var activity3 = Activity(title: "Test", date_from: "11:00", date_to: "13:00")
        
        self.activities += [activity1, activity2, activity3]
    }
    
    //MARK: Actions
    
    @IBAction func unwindToMealList(sender: UIStoryboardSegue) {
        
        if let sourceViewController = sender.source as? ViewController, let activity = sourceViewController.activity {
            
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                activities[selectedIndexPath.row] = activity
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
            } else {
            
                let newIndexPath = IndexPath(row: activities.count, section: 0)
                
                activities.append(activity)
                
                tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
        }
    }

}
