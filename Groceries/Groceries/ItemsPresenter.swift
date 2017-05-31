//
//  ItemsPresenter.swift
//  Groceries
//
//  Created by Oleksiy Bilyi on 5/30/17.
//  Copyright © 2017 Oleksiy Bilyi. All rights reserved.
//

import UIKit

class ItemsPresenter: ItemsInteractorOutput {
    
    // MARK: - Properties
    weak var listView: ShoppingItemsViewInterface?
    var itemsInteractor: ItemsInteractorInterface?
    var itemsWireframe: ItemsWireframeInterface?
    var shoppingList: ShoppingList?
    
    // MARK: - ItemsInteractorOutput
    func foundShoppingItems(items: [ShoppingItem]) {
        listView?.showShoppingItems(items: items)
    }
}

// MARK: - ItemsViewEventHandlerInterface
extension ItemsPresenter: ItemsViewEventHandlerInterface {
    
    func addNewItemAction() {
        itemsWireframe?.presentAddItemScreen()
    }
    
    func updateView() {
        itemsInteractor?.findShoppingItems()
    }
    
    func cancelAction() {
        itemsWireframe?.dismissAddModule()
    }
    
}
