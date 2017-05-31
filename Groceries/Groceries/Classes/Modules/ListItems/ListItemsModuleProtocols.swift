//
//  ListItemsModuleProtocols.swift
//  Groceries
//
//  Created by Oleksiy Bilyi on 5/31/17.
//  Copyright © 2017 Oleksiy Bilyi. All rights reserved.
//

import UIKit

// ITEMS_PRESENTER -> ITEMS_INTERACTOR
protocol ItemsInteractorInterface {
    var shoppingList: ShoppingList? {get set}
    
    func findShoppingItems()
}

// ITEMS_INTERACTOR -> ITEMS_PRESENTER
protocol ItemsInteractorOutput: class {
    var shoppingList: ShoppingList? {get set}
    
    func foundShoppingItems(items: [ShoppingItem])
}

// ITEMS_VIEW -> ITEMS_PRESENTER
protocol ItemsViewEventHandlerInterface {
    func addNewItemAction()
    func updateView()
    func cancelAction()
}

// ITEMS_PRESETER -> ITEMS_VIEW
protocol ShoppingItemsViewInterface: NSObjectProtocol {
    func showShoppingItems(items: [ShoppingItem])
    func reloadData()
}

// ITEMS_WIREFRAME INTERFACE
protocol ItemsWireframeInterface {
    var shoppingList: ShoppingList? {get set}
    
    func presentItemsModule(from view: UIViewController, for list: ShoppingList)
    func presentAddItemScreen()
    func dismissAddModule()
}
