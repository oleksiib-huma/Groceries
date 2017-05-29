//
//  DataStore.swift
//  Groceries
//
//  Created by Oleksiy Bilyi on 5/25/17.
//  Copyright © 2017 Oleksiy Bilyi. All rights reserved.
//

import UIKit
import RealmSwift

class DataStore {
    
    private func getRealm() -> Realm? {
        do {
            return try Realm()
        } catch let error{
            print("Something wrong with realm: \(error)")
        }
        return nil
    }
    
    func fetchShoppingItems(predicate: NSPredicate?, sortDescriptors: [SortDescriptor]?) -> Results<RealmShoppingItem>? {
        let realm = getRealm()
        var items = realm?.objects(RealmShoppingItem.self)
        
        if let predicate = predicate {
            items = items?.filter(predicate)
        }
        
        if let sortDecriptors = sortDescriptors {
            items = items?.sorted(by: sortDecriptors)
        }
        return items
    }
    
    func fetchShoppingLists(predicate: NSPredicate?, sortDescriptors: [SortDescriptor]?) -> Results<RealmShoppingList>? {
        let realm = getRealm()
        var items = realm?.objects(RealmShoppingList.self)
        
        if let predicate = predicate {
            items = items?.filter(predicate)
        }
        
        if let sortDecriptors = sortDescriptors {
            items = items?.sorted(by: sortDecriptors)
        }
        return items
    }

    func delete(object: Object) {
        let realm = getRealm()
        realm?.delete(object)
    }
    
    func deleteAll() {
        let realm = getRealm()
        realm?.deleteAll()
    }
    
    func update(updateBlock: () -> ()) {
        let realm = getRealm()
        do {
            try realm?.write {
                updateBlock()
            }
        } catch let error {
            print("Something wrong with realm write transaction: \(error)")
        }
    }
    
    func add(object: Object) {
        let realm = getRealm()
        realm?.add(object)
    }
}
