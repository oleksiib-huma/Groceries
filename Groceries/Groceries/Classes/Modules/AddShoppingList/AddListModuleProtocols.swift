//
//  AddShoppingListProtocols.swift
//  Groceries
//
//  Created by Oleksiy Bilyi on 5/31/17.
//  Copyright © 2017 Oleksiy Bilyi. All rights reserved.
//

import UIKit

// ADD_LIST_PRESENTER -> ADD_LIST_INTERACTOR
protocol AddListInteractorInterface {
    func saveNewListWith(name: String)
}

// ADD_LIST_INTERACTOR -> ADD_LIST_PRESENTER
protocol AddListInteractorOutput: class {
    func nameAlreadyExist()
    func nameSuccessfullySaved()
}

// ADD_VIEW_INTERACTOR -> ADD_LIST_PRESENTER
protocol AddNewViewEventHandlerInterface {
    func cancelAddAction()
    func saveAddActionWithName(name: String)
}

// ADD_LIST_PRESENTER -> ADD_VIEW_INTERACTOR
protocol AddNewViewInterface: class {
    func showNameAlreadyExistMassage()
}

// ADD_LIST_WIREFRAME PROTOCOL
protocol AddListWireframeInterface {
    func presentAddListModule(from view: UIViewController)
    func dismissAddModule()
}
