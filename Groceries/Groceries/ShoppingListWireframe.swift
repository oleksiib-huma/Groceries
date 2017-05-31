//
//  ShoppingListWireframe.swift
//  Groceries
//
//  Created by Oleksiy Bilyi on 5/29/17.
//  Copyright © 2017 Oleksiy Bilyi. All rights reserved.
//

import UIKit

protocol ListWireframeInterface {
    func presentShoppingListModule(from window: UIWindow)
    func presentAddListScreen()
}

class ShoppingListWireframe: ListWireframeInterface {
    
    var presentedView: UIViewController?
    let listControllerIdentifier = "listControllerIdentifier"
    
    func presentShoppingListModule(from window: UIWindow) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        presentedView = storyboard.instantiateViewController(withIdentifier: listControllerIdentifier)
        configureDependencies()
        window.rootViewController = presentedView
    }
    
    func configureDependencies() {
        let presenter = ListPresenter()
        let dataManager = ShoppingListManager()
        let interactor = ListInteractor(dataManager: dataManager)
        
        if let presentedView = presentedView as? ShoppingListController {
            presentedView.eventHandler = presenter
        }
        
        if let presentedView = presentedView as? ShoppingListViewInterface {
            presenter.listView = presentedView
        }
        presenter.listInteractor = interactor
        presenter.listWireframe = self
        
        interactor.output = presenter
    }
    
    func presentAddListScreen() {
        let addListWireframe = AddListWireframe()
        if let presentedView = presentedView {
            addListWireframe.presentAddListModule(from: presentedView)
        }
    }
}
