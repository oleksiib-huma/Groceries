//
//  MainViewPresenter.swift
//  Groceries
//
//  Created by Oleksiy Bilyi on 5/24/17.
//  Copyright © 2017 Oleksiy Bilyi. All rights reserved.
//

import UIKit

class ListPresenter: ListInteractorOutput {
    
    weak var listView: ShoppingListViewInterface?
    var listInteractor: ListInteractorInterface?
    var listWireframe: ListWireframeInterface?
    
    func foundShoppingLists(lists: [ShoppingList]) {
        listView?.showShoppingLists(lists: lists)
    }
    
}

extension ListPresenter: ListViewEventHandlerInterface {
    
    func addNewListAction() {
        listWireframe?.presentAddListScreen()
    }
    
    func updateView() {
        listInteractor?.findShoppingLists()
    }
    
    func editList(list: ShoppingList) {
        
    }
    
    func openList(list: ShoppingList) {
        
    }
    
    func openSettings() {
        
    }

}
