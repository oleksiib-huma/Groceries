//
//  ListEditInteractor.swift
//  Groceries
//
//  Created by Oleksiy Bilyi on 5/26/17.
//  Copyright © 2017 Oleksiy Bilyi. All rights reserved.
//

import UIKit

protocol ListEditInteractorInterface {
    
    func deleteShoppingListWith(name: String)
    func changeListName(name: String, in list: ShoppingList)
}

class ListEditInteractor: ListEditInteractorInterface {
    let dataManager: ShoppingListManager
    
    init(dataManager: ShoppingListManager) {
        self.dataManager = dataManager
    }
    
    func deleteShoppingListWith(name: String) {
        dataManager.deleteListBy(name: name)
    }
    
    func changeListName(name: String, in list: ShoppingList) {
        dataManager.set(name: name, for: list)
    }
    
}
