//
//  TestContact+CoreDataProperties.swift
//  ContactBook
//
//  Created by Kolbe Weathington on 4/19/19.
//  Copyright © 2019 Kolbe Weathington. All rights reserved.
//
//

import Foundation
import CoreData


extension TestContact {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TestContact> {
        return NSFetchRequest<TestContact>(entityName: "TestContact")
    }

    @NSManaged public var first: String?
    @NSManaged public var last: String?
    @NSManaged public var number: String?

}
