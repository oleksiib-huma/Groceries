//
//  AddItemInteractor.swift
//  Groceries
//
//  Created by Oleksiy Bilyi on 5/30/17.
//  Copyright © 2017 Oleksiy Bilyi. All rights reserved.
//

import UIKit

class AddItemInteractor: AddItemInteractorInterface {
    
    // MARK: - Properties
    private let dataManager: ItemsManagerInterface
    
    // MARK: - Init
    init(dataManager: ItemsManagerInterface) {
        self.dataManager = dataManager
    }
    
    // MARK: - AddItemInteractorInterface
    func saveNewItemWith(name: String, at list: ShoppingList) {
        dataManager.add(item: ShoppingItem(name: name,
                                           quantity: 0,
                                           note: "",
                                           isBought: false,
                                           categoryName: "",
                                           listName: list.name))
    }
}
