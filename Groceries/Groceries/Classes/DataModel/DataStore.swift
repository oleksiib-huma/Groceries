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
    
    func fetchEntities<T : Object>(predicate: NSPredicate?, sortDescriptors: [SortDescriptor]?) -> Results<T>? {
        let realm = getRealm()
        var items = realm?.objects(T.self)
        
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
        do {
            try realm?.write {
                realm?.delete(object)
            }
        } catch let error {
            print("Something wrong with realm delete object transaction: \(error)")
        }
    }
    
    func deleteAll() {
        let realm = getRealm()
        do {
            try realm?.write {
                realm?.deleteAll()
            }
        } catch let error {
            print("Something wrong with realm delete all transaction: \(error)")
        }
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
        do {
            try realm?.write {
                realm?.add(object)
            }
        } catch let error {
            print("Something wrong with realm add transaction: \(error)")
        }
    }

}
