//
//  ItemCategory.swift
//  Groceries
//
//  Created by Oleksiy Bilyi on 5/30/17.
//  Copyright © 2017 Oleksiy Bilyi. All rights reserved.
//

import UIKit

struct ItemCategory {
    var name: String
    var items: [ShoppingItem]
    
    init(name: String, items: [ShoppingItem]) {
        self.name = name
        self.items = items
    }
}
