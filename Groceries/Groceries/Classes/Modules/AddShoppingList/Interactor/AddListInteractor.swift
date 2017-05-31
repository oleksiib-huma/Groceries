//
//  AddListInteractor.swift
//  Groceries
//
//  Created by Oleksiy Bilyi on 5/26/17.
//  Copyright © 2017 Oleksiy Bilyi. All rights reserved.
//

import UIKit

class AddListInteractor: AddListInteractorInterface {
    
    // MARK: - Properties
    private let dataManager: ShoppingListManagerInterface
    weak var output: AddListInteractorOutput?
    
    // MARK: - Init
    init(dataManager: ShoppingListManagerInterface) {
        self.dataManager = dataManager
    }
    
    // MARK: - AddListInteractorInterface
    func saveNewListWith(name: String) {
        if dataManager.getListBy(name: name) == nil {
            dataManager.add(list: ShoppingList(name: name, created: NSDate(), itemsCount: 0, boughtItemsCount: 0))
            output?.nameSuccessfullySaved()
        } else {
            output?.nameAlreadyExist()
        }
    }
}
