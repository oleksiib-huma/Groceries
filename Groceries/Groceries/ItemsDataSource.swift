//
//  ItemsDataSource.swift
//  Groceries
//
//  Created by Oleksiy Bilyi on 5/24/17.
//  Copyright © 2017 Oleksiy Bilyi. All rights reserved.
//

import UIKit

protocol ItemsDataSource: DataSource {
    
    func getAllByListId(id: String) -> [T]
    func changeQuantityById(id: String, quantity: Int)
}

class ListItemsDataSource: ItemsDataSource {
    
}
