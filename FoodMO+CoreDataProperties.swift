//
//  FoodMO+CoreDataProperties.swift
//  KILOGO
//
//  Created by 蕭煜勳 on 2024/3/24.
//
//

import Foundation
import CoreData


extension FoodManagerObject {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FoodManagerObject> {
        return NSFetchRequest<FoodManagerObject>(entityName: "Food")
    }

    @NSManaged public var foodName: String?
    @NSManaged public var foodKcal: Float

}

extension FoodManagerObject : Identifiable {

}
