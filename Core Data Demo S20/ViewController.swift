//
//  ViewController.swift
//  Core Data Demo S20
//
//  Created by Mohammad Kiani on 2020-06-19.
//  Copyright © 2020 mohammadkiani. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
        
        // 1 step - we need to have an instance of app delegate
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        // 2 step - we need to create our context
        let context = appDelegate.persistentContainer.viewContext
        
        // 3 step - write to coredata
        let newContact = NSEntityDescription.insertNewObject(forEntityName: "Contact", into: context)
        
        // add data into context
//        newContact.setValue("Swati", forKey: "firstName")
//        newContact.setValue("Rathour", forKey: "lastName")
//        newContact.setValue(20, forKey: "age")
//        newContact.setValue("swati@example.com", forKey: "email")
        
        // 4 step - save data to coredata
//        do {
//            try context.save()
//        } catch {
//            print(error)
//        }
        
        
        // fetch data from coredata
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Contact")
        // using NSPredicate to norrow our query
//        request.predicate = NSPredicate(format: "firstName=[cd]%@", "swati")
//        request.predicate = NSPredicate(format: "firstName CONTAINS [cd]%@", "mo")
//        request.returnsObjectsAsFaults = false
        
        do {
            let results = try context.fetch(request)
            if results.count > 0 {
                
                for result in results as! [NSManagedObject] {
                    if let fName = result.value(forKey: "firstName") {
                        let firstName = fName as! String
                        print(firstName)
                        
                        // delete record
//                        context.delete(result)
                        
                        
                    }
                    if let email = result.value(forKey: "email") {
                        print(email)
                        // update all the emails to .ca
                        let email = email as! String
//                        result.setValue(email.dropLast(3) + "ca", forKey: "email")
//                        let newEmail = email.replacingOccurrences(of: "example", with: "myLambton")
//                        result.setValue(newEmail, forKey: "email")
//                        print(email)

                    }
                    
//                    do {
//                        try context.save()
//                    } catch {
//                        print(error)
//                    }
                    
                    
                    
                }
            }
        } catch {
            print(error)
        }
        
        
    }
    
    
}

