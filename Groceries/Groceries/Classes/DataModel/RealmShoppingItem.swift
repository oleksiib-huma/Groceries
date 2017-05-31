//
//  Item.swift
//  Groceries
//
//  Created by Oleksiy Bilyi on 5/24/17.
//  Copyright © 2017 Oleksiy Bilyi. All rights reserved.
//

import UIKit
import RealmSwift

class RealmShoppingItem: Object {
    dynamic var name: String = ""
    dynamic var quantity: Int = 0
    dynamic var shoppingList: RealmShoppingList? = nil
    dynamic var categoryName: String = ""
    dynamic var note: String = ""
    dynamic var isBought: Bool = false
}
