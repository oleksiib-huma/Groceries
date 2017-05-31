//
//  AddListController.swift
//  Groceries
//
//  Created by Oleksiy Bilyi on 5/29/17.
//  Copyright © 2017 Oleksiy Bilyi. All rights reserved.
//

import UIKit

class AddNewController: UIViewController, AddNewViewInterface {
    
    // MARK: - IBOutlets
    @IBOutlet weak var nameTextField: UITextField!
    
    // MARK: - Properties
    var eventHandler: AddNewViewEventHandlerInterface?
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - IBActions
    @IBAction func cancelButtonAction(_ sender: UIButton) {
        eventHandler?.cancelAddAction()
    }
    
    @IBAction func doneButtonAction(_ sender: UIButton) {
        eventHandler?.saveAddActionWithName(name: nameTextField.text ?? "")
    }
    
    // MARK: - AddListViewInterface
    func showNameAlreadyExistMassage() {
        let alert = UIAlertController(title: "Note", message: "Name already exist", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
            alert.dismiss(animated: true, completion: nil)
        }
        
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
}
