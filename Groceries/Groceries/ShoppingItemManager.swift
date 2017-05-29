//
//  ItemsDataSource.swift
//  Groceries
//
//  Created by Oleksiy Bilyi on 5/24/17.
//  Copyright © 2017 Oleksiy Bilyi. All rights reserved.
//

import UIKit
import RealmSwift

protocol ItemsManagerInterface {
    
    func getItem(name: String, in list: ShoppingList) -> ShoppingItem?
    func getAllItems(in list: ShoppingList) -> [ShoppingItem]
    func getAll() -> [ShoppingItem]
    func add(item: ShoppingItem)
    func set(quantity: Int, for item: ShoppingItem)
    func set(name: String, for item: ShoppingItem)
}

class ShoppingItemManager: ItemsManagerInterface {
    
    private let dataStore = DataStore()
    
    private func getDataStoreItem(name: String, listName: String) -> RealmShoppingItem? {
        let searchPredicate = NSPredicate(format: "name == %@ && shoppingListName == %@", name, listName)
        guard let dataStoreEntry = dataStore.fetchShoppingItems(predicate: searchPredicate, sortDescriptors: nil)?.first else {
            return nil
        }
        return dataStoreEntry
    }
    
    private func itemFromDataStoreEntity(_ entity: RealmShoppingItem) -> ShoppingItem {
        return ShoppingItem(name: entity.name,
                            image: UIImage(data: (entity.image as Data?) ?? Data()),
                            quantity: entity.quantity,
                            shoppingListName: entity.shoppingListName)
    }
    
    private func itemsFromDataStoreEntities(_ entities: Results<RealmShoppingItem>) -> [ShoppingItem] {
        return entities.map({ (realmShoppingItem) -> ShoppingItem in
            return ShoppingItem(name: realmShoppingItem.name,
                                image: UIImage(data: (realmShoppingItem.image as Data?) ?? Data()),
                                quantity: realmShoppingItem.quantity,
                                shoppingListName: realmShoppingItem.shoppingListName)
        })
    }

    // MARK: ItemsManagerInterface
    func getItem(name: String, in list: ShoppingList) -> ShoppingItem? {
        guard let dataStoreEntity = getDataStoreItem(name: name, listName: list.name) else {
            return nil
        }
        return itemFromDataStoreEntity(dataStoreEntity)
    }
    
    func getAllItems(in list: ShoppingList) -> [ShoppingItem] {
        let searchPredicate = NSPredicate(format: "shoppingListName == %@", list.name)
        guard let dataStoreEntries = dataStore.fetchShoppingItems(predicate: searchPredicate, sortDescriptors: nil) else {
            return []
        }
        
        return itemsFromDataStoreEntities(dataStoreEntries)
    }
    
    func getAll() -> [ShoppingItem] {
        guard let dataStoreEntities = dataStore.fetchShoppingItems(predicate: nil, sortDescriptors: nil) else {
            return []
        }
        return itemsFromDataStoreEntities(dataStoreEntities)
    }
    
    func add(item: ShoppingItem) {
        let dataStoteShoppingItem = RealmShoppingItem()
        dataStoteShoppingItem.name = item.name
        dataStoteShoppingItem.quantity = item.quantity
        dataStoteShoppingItem.shoppingListName = item.shoppingListName
        
        if let image = item.image {
            dataStoteShoppingItem.image = NSData(data: UIImagePNGRepresentation(image) ?? Data())
        }
        
        dataStore.add(object: dataStoteShoppingItem)
    }
    
    func set(quantity: Int, for item: ShoppingItem) {
        guard let dataStoreItem = getDataStoreItem(name: item.name, listName: item.shoppingListName) else {
            return
        }
        dataStore.update {
            dataStoreItem.quantity = quantity
        }
    }
    
    func set(name: String, for item: ShoppingItem) {
        guard let dataStoreItem = getDataStoreItem(name: item.name, listName: item.shoppingListName) else {
            return
        }
        dataStore.update {
            dataStoreItem.name = name
        }
    }
}
