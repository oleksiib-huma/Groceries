//
//  AddListWireframe.swift
//  Groceries
//
//  Created by Oleksiy Bilyi on 5/29/17.
//  Copyright © 2017 Oleksiy Bilyi. All rights reserved.
//

import UIKit

class AddListWireframe: AddListWireframeInterface {

    // MARK: - Properties
    private var presentedView: UIViewController?
    let kAddListControllerIdentifier = "addNewControllerIdentifier"
    
    // MARK: - Interanal funcions
    private func configureDependencies() {
        let presenter = AddListPresenter()
        let dataManager = ShoppingListManager()
        let interactor = AddListInteractor(dataManager: dataManager)
        
        if let presentedView = presentedView as? AddNewController {
            presentedView.eventHandler = presenter
        }
    
        if let presentedView = presentedView as? AddNewViewInterface {
            presenter.addListView = presentedView
        }
        presenter.addListInteractor = interactor
        presenter.addListWireframe = self
        
        interactor.output = presenter
    }
    
    // MARK: - AddListWireframeInterface
    func presentAddListModule(from view: UIViewController) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        presentedView = storyboard.instantiateViewController(withIdentifier: kAddListControllerIdentifier)
        
        configureDependencies()
        if let addListView = presentedView {
            view.present(addListView, animated: true, completion: nil)
        }
    }
    
    func dismissAddModule() {
        if let addListView = presentedView {
            addListView.dismiss(animated: true, completion: nil)
        }
    }

    
}
