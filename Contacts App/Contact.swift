//
//  Contact.swift
//  Contacts App
//
//  Created by Victor Lo on 9/7/16.
//  Copyright © 2016 Victor Lo. All rights reserved.
//

import UIKit

class Contact: NSObject {
//(1)first I need to create variables to store the name and other information
    var name: String?
    var phoneNumber: String? //(2)adding optionals
    
//(3)initializer
init(name: String? = nil, phoneNumber: String? = nil) {
    self.name = name //if you delete self, it won't know if you aree referning to this or this, because they both have the same name , so, if you do self. we know that the self. one is refering to the one declared on the clas and not the parameter/argument.
    self.phoneNumber = phoneNumber
super.init()
    }
    
    }

/*
struct App //do you know what a struct is? nope a struct is like a class, but it can just contain variables, not constructor. We make a struct called App were we will put the variables that we want to globally access, this means, for example, if we were going to add a "create new contact" window we would need to access the array of contacts from that class, while we also need to access the array from the tableview, so, we make a struct which contains this shared variables, did I explain it ok? yeah, its good
{
    static var contacts = [Contact]() //so here we make an array of type Contact
}
*/

//You can erase this one since you are declaring it on the ContactsTableViewController class, and now we have only one. To avoid problems, you can always do self.something instead of just something. so its a good practice to do self.? I personally do not do it too much UNLESS there are two variables with the same name, so I can differentiate them but I saw that in the course self is used a lot so why not. self is referring to what again? to the object, for example.