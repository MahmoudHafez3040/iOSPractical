//
//  Todoey.swift
//  iOSPractical
//
//  Created by MahmoudHafez on 4/17/20.
//  Copyright © 2020 MahmoudHafez. All rights reserved.
//

import Foundation
import UIKit

class TodoeyViewController : UIViewController
{
    // MARK: Varibles and Properies
    @IBOutlet var tableView: UITableView!
    var data = [Item]()
    let filePath =  FileManager.default.urls(for: .documentDirectory, in: FileManager.SearchPathDomainMask.userDomainMask).first?.appendingPathComponent("Items.plist")
    override func viewDidLoad() {
        print(filePath!)
        loadData()
    }
    // MARK: Add item button pressed
    @IBAction func AddNewItemPressed(_ sender: Any) {
        print(filePath!)
        var localTextfield = UITextField()
        let alert = UIAlertController(title: "Add new item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add", style: .default) { (action) in
            if let text = localTextfield.text
            {
                print(text)
                let item = Item()
                item.title = text
                item.done = false
                self.data.append(item)
                self.tableView.reloadData()
                let encoder = PropertyListEncoder()
                do
                {
                    let data =  try encoder.encode(self.data)
                    try data.write(to: self.filePath!)
                }
                catch
                {
                    print("Error encoding item array!")
                }
            }
        }
        alert.addAction(action)
        alert.addTextField { (textField) in
            textField.placeholder = "add text here!"
            localTextfield = textField
        }
        present(alert, animated: true, completion: nil)
    }
}
extension TodoeyViewController : UITableViewDataSource , UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "defualtCellidentifier", for: indexPath)
        cell.textLabel?.text=data[indexPath.row].title
        cell.accessoryType = data[indexPath.row].done ? .checkmark : .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        let cell = tableView.cellForRow(at: indexPath)
        
        if cell?.accessoryType == UITableViewCell.AccessoryType.checkmark
        {
            cell?.accessoryType = .none
        }
        else
        {
            cell?.accessoryType = UITableViewCell.AccessoryType.checkmark
        }
        data[indexPath.row].done = !data[indexPath.row].done
        saveData()
    }
}
extension TodoeyViewController
{
    // MARK: Methods
    func  saveData() {
        let encoder = PropertyListEncoder()
        do {
            let data =  try encoder.encode(self.data)
            try data.write(to: self.filePath!)
        } catch  {
            print("Error when loading data!")
        }
    }
    func loadData (){
        let data = try? Data(contentsOf: filePath!)
        let decoder = PropertyListDecoder()
        do {
            try self.data =  decoder.decode([Item].self, from: data!)
        } catch  {
            print("Error when loading data!")
        }
    }
}
