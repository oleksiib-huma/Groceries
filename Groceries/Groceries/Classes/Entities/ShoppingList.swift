//
//  ShoppingList.swift
//  Groceries
//
//  Created by Oleksiy Bilyi on 5/25/17.
//  Copyright © 2017 Oleksiy Bilyi. All rights reserved.
//

import UIKit

struct ShoppingList {
    var name: String
    var itemsCount: Int
    var boughtItemsCount: Int
    var created: NSDate
    
    init(name: String, created: NSDate, itemsCount: Int, boughtItemsCount: Int) {
        self.name = name
        self.created = created
        self.itemsCount = itemsCount
        self.boughtItemsCount = boughtItemsCount
    }
}
