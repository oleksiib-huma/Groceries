//
//  AddItemPresenter.swift
//  Groceries
//
//  Created by Oleksiy Bilyi on 5/30/17.
//  Copyright © 2017 Oleksiy Bilyi. All rights reserved.
//

import UIKit

class AddItemPresenter: AddNewViewEventHandlerInterface {
    
    // MARK: - Properties
    weak var addListView: AddNewViewInterface?
    var addListInteractor: AddItemInteractorInterface?
    var addItemWireframe: AddItemWireframeInterface?
    var shoppinglist: ShoppingList?
    
    // MARK: - AddListViewEventHandlerInterface
    func cancelAddAction() {
        addItemWireframe?.dismissAddModule()
    }
    
    func saveAddActionWithName(name: String) {
        if let list = shoppinglist {
            addListInteractor?.saveNewItemWith(name: name, at: list)
        }
        addItemWireframe?.dismissAddModule()
    }
}
