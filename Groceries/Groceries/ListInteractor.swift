//
//  ListInteractor.swift
//  Groceries
//
//  Created by Oleksiy Bilyi on 5/26/17.
//  Copyright © 2017 Oleksiy Bilyi. All rights reserved.
//

import UIKit

protocol ListInteractorInterface {
    
    func findShoppingLists()
}

protocol ListInteractorOutput: class {
    
    func foundShoppingLists(lists: [ShoppingList])
}

class ListInteractor: ListInteractorInterface {
    let dataManager: ShoppingListManager
    weak var output: ListInteractorOutput?
    
    init(dataManager: ShoppingListManager) {
        self.dataManager = dataManager
    }
    
    func findShoppingLists() {
        let shoppingLists = dataManager.getAll()
        output?.foundShoppingLists(lists: shoppingLists)
        
    }
}




