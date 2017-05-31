//
//  MainViewPresenter.swift
//  Groceries
//
//  Created by Oleksiy Bilyi on 5/24/17.
//  Copyright © 2017 Oleksiy Bilyi. All rights reserved.
//

import UIKit

class ListPresenter: ListInteractorOutput, ListViewEventHandlerInterface {
    
    // MARK: - Properies
    weak var listView: ShoppingListViewInterface?
    var listInteractor: ListInteractorInterface?
    var listWireframe: ListWireframeInterface?
    
    // MARK: - ListInteractorOutput
    func foundShoppingLists(lists: [ShoppingList]) {
        listView?.showShoppingLists(lists: lists)
    }
    
    // MARK: - ListViewEventHandlerInterface
    func addNewListAction() {
        listWireframe?.presentAddListScreen()
    }
    
    func updateView() {
        listInteractor?.findShoppingLists()
    }
    
    func editList(list: ShoppingList) {
        
    }
    
    func openList(list: ShoppingList) {
        listWireframe?.presentItemsScreen(for: list)
    }
    
    func openSettings() {
        
    }
}

