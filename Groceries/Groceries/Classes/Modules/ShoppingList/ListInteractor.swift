//
//  ListInteractor.swift
//  Groceries
//
//  Created by Oleksiy Bilyi on 5/26/17.
//  Copyright © 2017 Oleksiy Bilyi. All rights reserved.
//

import UIKit

class ListInteractor: ListInteractorInterface {
    
    // MARK: - Properies
    private let dataManager: ShoppingListManagerInterface
    weak var output: ListInteractorOutput?
    
    // MARK: - Init
    init(dataManager: ShoppingListManagerInterface) {
        self.dataManager = dataManager
    }
    
    // MARK: - ListInteractorInterface
    func findShoppingLists() {
        let shoppingLists = dataManager.getAll()
        output?.foundShoppingLists(lists: shoppingLists)
    }
}




