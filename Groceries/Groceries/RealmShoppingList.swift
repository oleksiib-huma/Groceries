//
//  ShoppingList.swift
//  Groceries
//
//  Created by Oleksiy Bilyi on 5/24/17.
//  Copyright © 2017 Oleksiy Bilyi. All rights reserved.
//

import UIKit
import RealmSwift

class RealmShoppingList: Object {
    dynamic var name: String = ""
    dynamic var created: NSDate = NSDate()
    dynamic var boughtItemsCount: Int = 0
    let items = LinkingObjects(fromType: RealmShoppingItem.self, property: "shoppingList")
    
    override static func primaryKey() -> String {
        return "name"
    }

}
