//
//  ShoppingListController.swift
//  Groceries
//
//  Created by Oleksiy Bilyi on 5/29/17.
//  Copyright © 2017 Oleksiy Bilyi. All rights reserved.
//

import UIKit

protocol ListViewEventHandlerInterface {
    
    func addNewListAction()
    func updateView()
    func editList(list: ShoppingList)
    func openList(list: ShoppingList)
    func openSettings()
}

protocol ShoppingListViewInterface: NSObjectProtocol {
    func showShoppingLists(lists: [ShoppingList])
    func reloadData()
}

class ShoppingListController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var eventHandler: ListViewEventHandlerInterface?
    var shoppinglists: [ShoppingList] = []
    
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
    
    @IBAction func editButtonAction(_ sender: UIButton) {
        
    }
    
    @IBAction func addNewButtonAction(_ sender: UIButton) {
        eventHandler?.addNewListAction()
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppinglists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "standart cell")
        
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "standart cell")
        }
        cell?.textLabel?.text = shoppinglists[indexPath.row].name
        cell?.detailTextLabel?.text = shoppinglists[indexPath.row].created.description
        
        if let cell = cell {
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return .delete
    }

}

extension ShoppingListController: ShoppingListViewInterface {
    
    func showShoppingLists(lists: [ShoppingList]) {
        shoppinglists = lists
        tableView.reloadData()
    }
    
    func reloadData() {
        tableView.reloadData()
    }
    
}
