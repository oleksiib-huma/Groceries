//
//  AddItemWireframe.swift
//  Groceries
//
//  Created by Oleksiy Bilyi on 5/30/17.
//  Copyright © 2017 Oleksiy Bilyi. All rights reserved.
//

import UIKit

class AddItemWireframe: AddItemWireframeInterface {

    // MARK: - Properties
    var shoppingList: ShoppingList?
    private var presentedView: UIViewController?
    let kAddNewControllerIdentifier = "addNewControllerIdentifier"
    
    // MARK: - Internal functions
    private func configureDependencies() {
        let presenter = AddItemPresenter()
        let dataManager = ShoppingItemManager()
        let interactor = AddItemInteractor(dataManager: dataManager)
        
        if let presentedView = presentedView as? AddNewController {
            presentedView.eventHandler = presenter
        }
        
        if let presentedView = presentedView as? AddNewViewInterface {
            presenter.addListView = presentedView
        }
        presenter.shoppinglist = shoppingList
        presenter.addListInteractor = interactor
        presenter.addItemWireframe = self
    }
    
    // MARK: - AddItemWireframeInterface
    func presentAddItemModule(from view: UIViewController, for list: ShoppingList) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        presentedView = storyboard.instantiateViewController(withIdentifier: kAddNewControllerIdentifier)
        shoppingList = list
        
        configureDependencies()
        if let addNewView = presentedView {
            view.present(addNewView, animated: true, completion: nil)
        }
    }
    
    func dismissAddModule() {
        if let addNewView = presentedView {
            addNewView.dismiss(animated: true, completion: nil)
        }
    }

    
}
