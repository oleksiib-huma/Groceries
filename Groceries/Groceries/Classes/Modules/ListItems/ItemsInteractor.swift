//
//  ItemsInteractor.swift
//  Groceries
//
//  Created by Oleksiy Bilyi on 5/30/17.
//  Copyright © 2017 Oleksiy Bilyi. All rights reserved.
//

import UIKit

class ItemsInteractor: ItemsInteractorInterface {
    
    // MARK: - Properties
    private let dataManager: ItemsManagerInterface
    var shoppingList: ShoppingList?
    weak var output: ItemsInteractorOutput?
    
    // MARK: - Init
    init(dataManager: ItemsManagerInterface) {
        self.dataManager = dataManager
    }
    
    // MARK: - ItemsInteractorInterface
    func findShoppingItems() {
        if let shoppingList = shoppingList {
            let shoppingItems = dataManager.getAllItems(in: shoppingList)
            output?.foundShoppingItems(items: shoppingItems)
        }
    }
    
}
