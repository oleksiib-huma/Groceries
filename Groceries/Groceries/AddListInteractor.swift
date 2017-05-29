//
//  AddListInteractor.swift
//  Groceries
//
//  Created by Oleksiy Bilyi on 5/26/17.
//  Copyright © 2017 Oleksiy Bilyi. All rights reserved.
//

import UIKit

protocol AddListInteractorInterface {
    
    func saveNewListWith(name: String)
}

protocol AddListInteractorOutput {
    
    func saveNewListWith(name: String)
}

class AddListInteractor: AddListInteractorInterface {
    
    let dataManager: ShoppingListManager
    
    init(dataManager: ShoppingListManager) {
        self.dataManager = dataManager
    }
    
    func saveNewListWith(name: String) {
        dataManager.add(list: ShoppingList(name: name, created: NSDate()))
    }
}
