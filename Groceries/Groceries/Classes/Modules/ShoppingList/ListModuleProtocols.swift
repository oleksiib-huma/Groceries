//
//  File.swift
//  Groceries
//
//  Created by Oleksiy Bilyi on 5/31/17.
//  Copyright © 2017 Oleksiy Bilyi. All rights reserved.
//

import UIKit

// LIST_PRESENTER -> LIST_INTERACTOR
protocol ListInteractorInterface {
    func findShoppingLists()
}

// LIST_INTERACTOR -> LIST_PRESENTER
protocol ListInteractorOutput: class {
    func foundShoppingLists(lists: [ShoppingList])
}

// LIST WIRAFRAME PROTOCOL
protocol ListWireframeInterface {
    func presentShoppingListModule(from window: UIWindow)
    func presentItemsScreen(for list: ShoppingList)
    func presentAddListScreen()
}

// LIST_VIEW -> LIST_PRESENTER
protocol ListViewEventHandlerInterface {
    
    func addNewListAction()
    func updateView()
    func editList(list: ShoppingList)
    func openList(list: ShoppingList)
    func openSettings()
}

// LIST_PRESENTER -> LIST_VIEW
protocol ShoppingListViewInterface: class {
    func showShoppingLists(lists: [ShoppingList])
    func reloadData()
}


