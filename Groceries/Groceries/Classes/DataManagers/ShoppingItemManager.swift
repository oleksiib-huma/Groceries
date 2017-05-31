//
//  ItemsDataSource.swift
//  Groceries
//
//  Created by Oleksiy Bilyi on 5/24/17.
//  Copyright © 2017 Oleksiy Bilyi. All rights reserved.
//

import UIKit
import RealmSwift

class ShoppingItemManager: ItemsManagerInterface {
    
    private let dataStore = DataStore()
    
    private func getDataStoreItem(name: String, listName: String) -> RealmShoppingItem? {
        let searchPredicate = NSPredicate(format: "name == %@ && shoppingList.name == %@", name, listName)
        guard let dataStoreEntry: RealmShoppingItem = dataStore.fetchEntities(predicate: searchPredicate, sortDescriptors: nil)?.first else {
            return nil
        }
        return dataStoreEntry
    }
    
    private func itemFromDataStoreEntity(_ entity: RealmShoppingItem) -> ShoppingItem {
        return ShoppingItem(name: entity.name,
                            quantity: entity.quantity,
                            note: entity.note,
                            isBought: entity.isBought,
                            categoryName: entity.categoryName,
                            listName: entity.shoppingList?.name ?? "")
    }
    
    private func itemsFromDataStoreEntities(_ entities: Results<RealmShoppingItem>) -> [ShoppingItem] {
        return entities.map({ (realmShoppingItem) -> ShoppingItem in
            return ShoppingItem(name: realmShoppingItem.name,
                                quantity: realmShoppingItem.quantity,
                                note: realmShoppingItem.note,
                                isBought: realmShoppingItem.isBought,
                                categoryName: realmShoppingItem.categoryName,
                                listName: realmShoppingItem.shoppingList?.name ?? "")
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
        let searchPredicate = NSPredicate(format: "shoppingList.name == %@", list.name)
        guard let dataStoreEntries: Results<RealmShoppingItem> = dataStore.fetchEntities(predicate: searchPredicate, sortDescriptors: nil) else {
            return []
        }
        
        return itemsFromDataStoreEntities(dataStoreEntries)
    }
    
    func getAll() -> [ShoppingItem] {
        guard let dataStoreEntities: Results<RealmShoppingItem> = dataStore.fetchEntities(predicate: nil, sortDescriptors: nil) else {
            return []
        }
        return itemsFromDataStoreEntities(dataStoreEntities)
    }
    
    func add(item: ShoppingItem) {
        let dataStoteShoppingItem = RealmShoppingItem()
        dataStoteShoppingItem.name = item.name
        dataStoteShoppingItem.quantity = item.quantity
        dataStoteShoppingItem.note = item.note
        dataStoteShoppingItem.categoryName = item.categoryName
        dataStoteShoppingItem.isBought = item.isBought
        
        let realmList: RealmShoppingList? = dataStore.fetchEntities(predicate: NSPredicate(format: "name == %@", item.listName), sortDescriptors: nil)?.first
        dataStoteShoppingItem.shoppingList = realmList
        
        dataStore.add(object: dataStoteShoppingItem)
    }
    
    func set(quantity: Int, for item: ShoppingItem) {
        guard let dataStoreItem = getDataStoreItem(name: item.name, listName: item.listName) else {
            return
        }
        dataStore.update {
            dataStoreItem.quantity = quantity
        }
    }
    
    func set(name: String, for item: ShoppingItem) {
        guard let dataStoreItem = getDataStoreItem(name: item.name, listName: item.listName) else {
            return
        }
        dataStore.update {
            dataStoreItem.name = name
        }
    }
}
