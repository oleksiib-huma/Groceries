//
//  ShoppingItem.swift
//  Groceries
//
//  Created by Oleksiy Bilyi on 5/25/17.
//  Copyright © 2017 Oleksiy Bilyi. All rights reserved.
//

import UIKit

struct ShoppingItem {
    var name: String
    var quantity: Int
    var isBought: Bool
    var note: String
    var categoryName: String
    var listName: String

    init(name: String, quantity: Int, note: String, isBought: Bool, categoryName: String, listName: String) {
        self.name = name
        self.quantity = quantity
        self.note = note
        self.isBought = isBought
        self.categoryName = categoryName
        self.listName = listName
    }
}
