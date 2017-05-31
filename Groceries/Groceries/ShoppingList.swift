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
    var created: NSDate
    
    init(name: String, created: NSDate) {
        self.name = name
        self.created = created
    }
}
