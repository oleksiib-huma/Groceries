//
//  RealmItemCategory.swift
//  Groceries
//
//  Created by Oleksiy Bilyi on 5/30/17.
//  Copyright © 2017 Oleksiy Bilyi. All rights reserved.
//

import UIKit
import RealmSwift

class RealmItemCategory: Object {
    dynamic var name: String = ""
    let items = List<RealmShoppingItem>()
    
    override static func primaryKey() -> String {
        return "name"
    }
}
