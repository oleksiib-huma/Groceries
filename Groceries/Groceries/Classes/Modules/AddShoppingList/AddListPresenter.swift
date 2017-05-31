//
//  AddListPresenter1.swift
//  Groceries
//
//  Created by Oleksiy Bilyi on 5/29/17.
//  Copyright © 2017 Oleksiy Bilyi. All rights reserved.
//

import UIKit

class AddListPresenter: AddNewViewEventHandlerInterface, AddListInteractorOutput {
    
    // MARK - Properties
    weak var addListView: AddNewViewInterface?
    var addListInteractor: AddListInteractorInterface?
    var addListWireframe: AddListWireframeInterface?
    
    // MARK: - AddListViewEventHandlerInterface
    func cancelAddAction() {
        addListWireframe?.dismissAddModule()
    }
    
    func saveAddActionWithName(name: String) {
        addListInteractor?.saveNewListWith(name: name)
    }
    
    // MARK: - AddListInteractorOutput
    func nameAlreadyExist() {
         addListView?.showNameAlreadyExistMassage()
    }
    
    func nameSuccessfullySaved() {
        addListWireframe?.dismissAddModule()
    }
}
