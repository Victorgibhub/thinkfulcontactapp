//
//  DetailViewController.swift
//  Contacts App
//
//  Created by Victor Lo on 9/7/16.
//  Copyright © 2016 Victor Lo. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var phoneNumber: UILabel!
    var contact: Contact?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let contact = self.contact {
            if let name = contact.name {
             self.nameLabel.text = name
                
            }
            if let phoneNumber = contact.phoneNumber {
                
                self.phoneNumber.text = phoneNumber
            }
            
            
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
