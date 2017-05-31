//
//  ItemsViewController.swift
//  Groceries
//
//  Created by Oleksiy Bilyi on 5/30/17.
//  Copyright © 2017 Oleksiy Bilyi. All rights reserved.
//

import UIKit

class ItemsController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    var eventHandler: ItemsViewEventHandlerInterface?
    var items: [ShoppingItem] = []
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.flashScrollIndicators()
        eventHandler?.updateView()
    }

    // MARK: - IBActions
    @IBAction func addNewItemAction(_ sender: UIButton) {
        eventHandler?.addNewItemAction()
    }
    
    @IBAction func cancelAction(_ sender: UIButton) {
        eventHandler?.cancelAction()
    }
    
    // MARK: - UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "standart cell")
        
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "standart cell")
        }
        cell?.textLabel?.text = items[indexPath.row].name
        
        if let cell = cell {
            return cell
        }
        return UITableViewCell()
    }
    
    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return .delete
    }

}

// MARK: - ShoppingItemsViewInterface
extension ItemsController: ShoppingItemsViewInterface {
    
    func showShoppingItems(items: [ShoppingItem]) {
        self.items = items
        tableView.reloadData()
    }
    
    func reloadData() {
        tableView.reloadData()
    }
    
}
