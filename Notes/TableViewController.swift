//
//  TableViewController.swift
//  Notes
//
//  Created by Владислав Ковальский on 30.01.2022.
//

import UIKit

class TableViewController: UITableViewController {
    
    @IBOutlet var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(loadList), name: NSNotification.Name(rawValue: "load"), object: nil)
        if !items.contains(Items(title: "Тестовая заметка", note: "Для ЦФТ")) {
            addItem(title: "Тестовая заметка", note: "Для ЦФТ")
        }
    }
    
    @IBAction func addNote(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(identifier: "new") as? EntryViewController else {
            return
        }
        vc.title = "Новая заметка"
        vc.navigationItem.largeTitleDisplayMode = .never
        vc.completion = { noteTitle, note in
            self.navigationController?.popToRootViewController(animated: true)
            addItem(title: noteTitle, note: note)
            self.table.reloadData()
        }
        navigationController?.pushViewController(vc, animated: true)
    }
     
    @objc func loadList(notification: NSNotification){
        self.tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row].title
        cell.detailTextLabel?.text = items[indexPath.row].note
        return cell
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            deleteItem(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            self.table.reloadData()
        }
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let item = items[indexPath.row]
        
        // Show NoteViewController
        guard let vc = storyboard?.instantiateViewController(identifier: "note") as? NoteViewController else {
            return
        }
        vc.navigationItem.largeTitleDisplayMode = .never
        vc.title = "Заметка"
        vc.noteTitle = item.title
        vc.note = item.note
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
