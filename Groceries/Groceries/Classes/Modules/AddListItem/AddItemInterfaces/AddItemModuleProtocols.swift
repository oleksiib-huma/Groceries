//
//  File.swift
//  Groceries
//
//  Created by Oleksiy Bilyi on 5/31/17.
//  Copyright © 2017 Oleksiy Bilyi. All rights reserved.
//

import UIKit

// ADD_ITEM_PRESENTER -> ADD_ITEM_ITERACTOR
protocol AddItemInteractorInterface {
    func saveNewItemWith(name: String, at list: ShoppingList)
}

// ADD_ITEM_WIREFRAME PROTOCOL 
protocol AddItemWireframeInterface {
    var shoppingList: ShoppingList? {get set}
    
    func presentAddItemModule(from view: UIViewController, for list: ShoppingList)
    func dismissAddModule()
}
