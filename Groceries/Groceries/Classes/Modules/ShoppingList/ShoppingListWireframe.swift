//
//  ShoppingListWireframe.swift
//  Groceries
//
//  Created by Oleksiy Bilyi on 5/29/17.
//  Copyright © 2017 Oleksiy Bilyi. All rights reserved.
//

import UIKit

class ShoppingListWireframe: ListWireframeInterface {
    
    // MARK: - Properies
    private let kListControllerIdentifier = "listControllerIdentifier"
    private weak var presentedView: UIViewController?
    
    // MARK: - Internal functions
    private func configureDependencies() {
        let presenter = ListPresenter()
        let dataManager = ShoppingListManager()
        let interactor = ListInteractor(dataManager: dataManager)
        
        if let presentedView = presentedView as? ShoppingListViewInterface {
            presenter.listView = presentedView
        }
        presenter.listInteractor = interactor
        presenter.listWireframe = self
        
        if let presentedView = presentedView as? ShoppingListController {
            presentedView.eventHandler = presenter
        }
        interactor.output = presenter
    }
    
    // MARK: - ListWireframeInterface
    func presentShoppingListModule(from window: UIWindow) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        presentedView = storyboard.instantiateViewController(withIdentifier: kListControllerIdentifier)
        configureDependencies()
        window.rootViewController = presentedView
    }
    
    func presentAddListScreen() {
        let addListWireframe = AddListWireframe()
        if let presentedView = presentedView {
            addListWireframe.presentAddListModule(from: presentedView)
        }
    }
    
    func presentItemsScreen(for list: ShoppingList) {
        let itemsWireframe = ShoppingItemWireframe()
        if let presentedView = presentedView {
            itemsWireframe.presentItemsModule(from: presentedView, for: list)
        }
    }
}
