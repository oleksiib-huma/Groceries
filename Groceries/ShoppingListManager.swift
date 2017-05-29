//
//  ShoppingLisDataSource.swift
//  Groceries
//
//  Created by Oleksiy Bilyi on 5/24/17.
//  Copyright © 2017 Oleksiy Bilyi. All rights reserved.
//

import UIKit
import RealmSwift

protocol ShoppingListManagerInterface {
    func getListBy(name: String) -> ShoppingList?
    func getAll() -> [ShoppingList]
    func add(list: ShoppingList)
    func set(name: String, for list: ShoppingList)
    func deleteListBy(name: String)
    func deleteAll()
}

class ShoppingListManager: ShoppingListManagerInterface {
    
    private let dataStore = DataStore()
    
    private func getDataStoreListByName(name: String) -> RealmShoppingList? {
        guard let dataStoreEntry: RealmShoppingList = dataStore.fetchEntities(predicate: NSPredicate(format: "name == %@", name), sortDescriptors: nil)?.first else {
            return nil
        }
        return dataStoreEntry
    }
    
    private func listFromDataStoreEntity(_ entity: RealmShoppingList) -> ShoppingList {
        return ShoppingList(name: entity.name, created: entity.created)
    }
    
    private func listsFromDataStoreEntities(_ entities: Results<RealmShoppingList>) -> [ShoppingList] {
        return entities.map({ (realmShoppingList) -> ShoppingList in
            return ShoppingList(name: realmShoppingList.name, created: realmShoppingList.created)
        })
    }

    // MARK: ShoppingListManagerInterface
    func getListBy(name: String) -> ShoppingList? {
        guard let dataStoreEntity = getDataStoreListByName(name: name) else {
            return nil
        }
        return listFromDataStoreEntity(dataStoreEntity)
    }
    
    func getAll() -> [ShoppingList] {
        guard let dataStoreEntities: Results<RealmShoppingList> = dataStore.fetchEntities(predicate: nil, sortDescriptors: nil) else {
            return []
        }
        return listsFromDataStoreEntities(dataStoreEntities)
    }
    
    func set(name: String, for list: ShoppingList) {
        guard let dataStoreList = getDataStoreListByName(name: list.name) else {
            return
        }
        dataStore.update {
            dataStoreList.name = name
        }
    }
    
    func add(list: ShoppingList) {
        let dataStoteShoppingList = RealmShoppingList()
        dataStoteShoppingList.name = list.name
        dataStoteShoppingList.created = list.created
        
        dataStore.add(object: dataStoteShoppingList)
    }
    
    func deleteListBy(name: String) {
        guard let dataStoreEntry: RealmShoppingList = dataStore.fetchEntities(predicate: NSPredicate(format: "name == %@", name), sortDescriptors: nil)?.first else {
            return
        }
        dataStore.delete(object: dataStoreEntry)
    }

    func deleteAll() {
        dataStore.deleteAll()
    }
}

