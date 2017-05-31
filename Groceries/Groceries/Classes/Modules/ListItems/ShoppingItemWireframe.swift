//
//  ShoppingItemWireframe.swift
//  Groceries
//
//  Created by Oleksiy Bilyi on 5/30/17.
//  Copyright © 2017 Oleksiy Bilyi. All rights reserved.
//

import UIKit

class ShoppingItemWireframe: ItemsWireframeInterface {

    // MARK: - Properties
    var shoppingList: ShoppingList?
    var presentedView: UIViewController?
    let kItemsControllerIdentifier = "itemsControllerIdentifier"
    
    // MARK: - Internal functions
    private func configureDependencies() {
        let presenter = ItemsPresenter()
        let dataManager = ShoppingItemManager()
        let interactor = ItemsInteractor(dataManager: dataManager)
        interactor.shoppingList = shoppingList
        
        if let presentedView = presentedView as? ItemsController {
            presentedView.eventHandler = presenter
        }
        
        if let presentedView = presentedView as? ShoppingItemsViewInterface {
            presenter.listView = presentedView
        }
        presenter.shoppingList = shoppingList
        presenter.itemsInteractor = interactor
        presenter.itemsWireframe = self
        
        interactor.output = presenter
    }
    
    // MARK: - ItemsWireframeInterface
    func presentItemsModule(from view: UIViewController, for list: ShoppingList) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        presentedView = storyboard.instantiateViewController(withIdentifier: kItemsControllerIdentifier)
        shoppingList = list
        
        configureDependencies()
        if let itemsView = presentedView {
            view.present(itemsView, animated: true, completion: nil)
        }
    }
    
    func presentAddItemScreen() {
        let addItemWireframe = AddItemWireframe()
        if let presentedView = presentedView, let shoppingList = shoppingList {
            addItemWireframe.presentAddItemModule(from: presentedView, for: shoppingList)
        }
    }
    
    func dismissAddModule() {
        if let itemsView = presentedView {
            itemsView.dismiss(animated: true, completion: nil)
        }
    }

}
