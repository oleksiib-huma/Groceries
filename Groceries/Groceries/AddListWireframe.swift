//
//  AddListWireframe.swift
//  Groceries
//
//  Created by Oleksiy Bilyi on 5/29/17.
//  Copyright © 2017 Oleksiy Bilyi. All rights reserved.
//

import UIKit

protocol AddListWireframeInterface {
    func presentAddListModule(from view: UIViewController)
    func dismissAddModule()
}


class AddListWireframe: AddListWireframeInterface {

    var presentedView: UIViewController?
    let addListControllerIdentifier = "addListControllerIdentifier"
    
    func presentAddListModule(from view: UIViewController) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        presentedView = storyboard.instantiateViewController(withIdentifier: addListControllerIdentifier)
        
        configureDependencies()
        if let addListView = presentedView {
            view.present(addListView, animated: true, completion: nil)
        }
    }
    
    func configureDependencies() {
        let presenter = AddListPresenter()
        let dataManager = ShoppingListManager()
        let interactor = AddListInteractor(dataManager: dataManager)
        
        if let presentedView = presentedView as? AddListController {
            presentedView.eventHandler = presenter
        }
        
        if let presentedView = presentedView as? AddListViewInterface {
            presenter.addListView = presentedView
        }
        presenter.addListInteractor = interactor
        presenter.addListWireframe = self
    }
    
    func dismissAddModule() {
        if let addListView = presentedView {
            addListView.dismiss(animated: true, completion: nil)
        }
    }

    
}
