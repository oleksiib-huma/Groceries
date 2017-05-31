//
//  AddListController.swift
//  Groceries
//
//  Created by Oleksiy Bilyi on 5/29/17.
//  Copyright © 2017 Oleksiy Bilyi. All rights reserved.
//

import UIKit

protocol AddListViewEventHandlerInterface {
    
    func cancelAddAction()
    func saveAddActionWithName(name: String)
}

protocol AddListViewInterface: NSObjectProtocol {
    
}

class AddListController: UIViewController, AddListViewInterface {
    
    @IBOutlet weak var nameTextField: UITextField!
    var eventHandler: AddListViewEventHandlerInterface?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func cancelButtonAction(_ sender: UIButton) {
        eventHandler?.cancelAddAction()
    }
    
    @IBAction func doneButtonAction(_ sender: UIButton) {
        eventHandler?.saveAddActionWithName(name: nameTextField.text ?? "")
    }
}
