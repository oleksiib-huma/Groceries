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
    var image: UIImage?
    var quantity: Int
    let shoppingListName: String

    init(name: String, image: UIImage?, quantity: Int, shoppingListName: String) {
        self.name = name
        self.image = image
        self.quantity = quantity
        self.shoppingListName = shoppingListName
    }
}
