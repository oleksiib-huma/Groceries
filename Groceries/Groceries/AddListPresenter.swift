//
//  AddListPresenter1.swift
//  Groceries
//
//  Created by Oleksiy Bilyi on 5/29/17.
//  Copyright © 2017 Oleksiy Bilyi. All rights reserved.
//

import UIKit

class AddListPresenter {
    
    weak var addListView: AddListViewInterface?
    var addListInteractor: AddListInteractorInterface?
    var addListWireframe: AddListWireframeInterface?
}

extension AddListPresenter: AddListViewEventHandlerInterface {
    
    func cancelAddAction() {
        addListWireframe?.dismissAddModule()
    }
    
    func saveAddActionWithName(name: String) {
        addListInteractor?.saveNewListWith(name: name)
        addListWireframe?.dismissAddModule()
    }
    
}
