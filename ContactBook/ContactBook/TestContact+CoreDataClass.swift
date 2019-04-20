//
//  TestContact+CoreDataClass.swift
//  ContactBook
//
//  Created by Kolbe Weathington on 4/19/19.
//  Copyright © 2019 Kolbe Weathington. All rights reserved.
//
//

import UIKit
import CoreData

@objc(TestContact)
public class TestContact: NSManagedObject {
    
    convenience init?(firstName first: String?, lastName last :String?, phoneNumber number : String?) {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        guard let managedContent = appDelegate?.persistentContainer.viewContext else{
            return nil
        }
        
        self.init(entity: TestContact.entity(), insertInto: managedContent)
        self.first = first
        self.last = last
        self.number = number
        
    }

}
