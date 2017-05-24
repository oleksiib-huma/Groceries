//
//  ShoppingLisDataSource.swift
//  Groceries
//
//  Created by Oleksiy Bilyi on 5/24/17.
//  Copyright © 2017 Oleksiy Bilyi. All rights reserved.
//

import UIKit

protocol DataSource {
    associatedtype T
    
    func getAll() -> [T]
    func getById(id: String) -> T
    func insert(item: T)
    func update(item: T)
    func deleteById(id: String)
    func deleteAll()
}

class ShoppingListDataSource: DataSource {
    

}
