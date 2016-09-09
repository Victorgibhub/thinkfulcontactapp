//
//  ContactsTableViewController.swift
//  Contacts App
//
//  Created by Victor Lo on 9/7/16.
//  Copyright © 2016 Victor Lo. All rights reserved.
//

import UIKit

class ContactsTableViewController: UITableViewController {

    var contacts: [Contact] = []
    
    
    //This is saying var contacts is suppose to be an array. but why [Contact] class is needed? because you need to tell the program what kind of array you are constructing. is it Integers? Strings? Contacts? so we specify Contact to let it know that we are storing contacts into it. so we can basically let contacts know that we are storing the properties of Contract here and use it as an Array of Strings. with "use it as an array of strings" calling name and phone# as string, you can access the properties and functions of each of the contacts stored in that array.
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let moveButton = UIBarButtonItem(barButtonSystemItem: .Edit, target: self, action: Selector("toggleEdit"))
        
        navigationItem.leftBarButtonItem = moveButton
        
        //lesson is telling to create contacts here. why create it under viewDidLoad?
        
        let James = Contact(name: "James", phoneNumber: "4151112222")
        let Elias = Contact(phoneNumber: "2223334444")
        let Mary = Contact(name: "Mary")
     
        self.contacts.append(James)
        self.contacts.append(Elias)
        self.contacts.append(Mary)

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    func toggleEdit () {
      tableView.setEditing(!tableView.editing, animated: true)
        
        if tableView.editing {
         self.navigationItem.rightBarButtonItem?.title = "Done"
            
        } else {
            
            self.navigationItem.rightBarButtonItem?.title = "Edit"
            
        }
            
            
        
    }
    
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
        
        
        let contactMoving = contacts.removeAtIndex(fromIndexPath.row)
        contacts.insert(contactMoving, atIndex: toIndexPath.row)
    }
    
    override func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        
        if tableView.editing {
            
            return .None
            
        } else {
            
          return .Delete
            
        }
    }
    
    override func tableView(tableView: UITableView, shouldIndentWhileEditingRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    
    return false
    
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let indexPath = self.tableView.indexPathForCell(sender as! UITableViewCell)!
        //force unwrapped because you want to make it a UItableview
        let contact = self.contacts[indexPath.row] //pulling this from the array. indexPath.row means the row that the user clicked on..
        let destination = segue.destinationViewController as! DetailViewController //forcing casting as DetailViewCont. Force unwrapping is making sure that its the type of objects that you want
        destination.contact = contact
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.contacts.count
    }

    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        
    return true
        
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == .Delete {
        self.contacts.removeAtIndex(indexPath.row)
         tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
        
    }
    
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        let contact = self.contacts[indexPath.row] //indexpath.row is returning the an INT from the array.
        
        if let name = contact.name { //let contact = self.contacts[indexPath.row] thats where contact.name comes from?
            
            
         cell.textLabel?.text = name //this is saying return the name in the cell as text? why is it optional? Label could be nil
        } else {
            
         cell.textLabel?.text = "No Name"
            
        }
        
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
