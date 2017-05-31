//
//  ShoppingListController.swift
//  Groceries
//
//  Created by Oleksiy Bilyi on 5/29/17.
//  Copyright © 2017 Oleksiy Bilyi. All rights reserved.
//

import UIKit

class ShoppingListController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    // MARK: - Properties
    var eventHandler: ListViewEventHandlerInterface?
    fileprivate var shoppinglists: [ShoppingList] = []
    
    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!

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
    @IBAction func editButtonAction(_ sender: UIButton) {
        
    }
    
    @IBAction func addNewButtonAction(_ sender: UIButton) {
        eventHandler?.addNewListAction()
    }

    // MARK: - UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppinglists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "standart cell")
        let list = shoppinglists[indexPath.row]
        
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "standart cell")
        }
        cell?.textLabel?.text = list.name
        cell?.detailTextLabel?.text = "\(list.created.description) \(list.boughtItemsCount)/\(list.itemsCount)"
        
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        eventHandler?.openList(list: shoppinglists[indexPath.row])
    }

}

// MARK: - ShoppingListViewInterface
extension ShoppingListController: ShoppingListViewInterface {
    
    func showShoppingLists(lists: [ShoppingList]) {
        shoppinglists = lists
        tableView.reloadData()
    }
    
    func reloadData() {
        tableView.reloadData()
    }
    
}
