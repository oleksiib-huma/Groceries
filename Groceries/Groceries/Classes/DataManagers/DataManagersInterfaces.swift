//
//  DataManagersInterfaces.swift
//  Groceries
//
//  Created by Oleksiy Bilyi on 5/31/17.
//  Copyright © 2017 Oleksiy Bilyi. All rights reserved.
//

import Foundation

protocol ShoppingListManagerInterface {
    func getListBy(name: String) -> ShoppingList?
    func getAll() -> [ShoppingList]
    func add(list: ShoppingList)
    func set(name: String, for list: ShoppingList)
    func set(boughtItemsCount: Int, for list: ShoppingList)
    func deleteListBy(name: String)
    func deleteAll()
}

protocol ItemsManagerInterface {
    func getItem(name: String, in list: ShoppingList) -> ShoppingItem?
    func getAllItems(in list: ShoppingList) -> [ShoppingItem]
    func getAll() -> [ShoppingItem]
    func add(item: ShoppingItem)
    func set(quantity: Int, for item: ShoppingItem)
    func set(name: String, for item: ShoppingItem)
}
