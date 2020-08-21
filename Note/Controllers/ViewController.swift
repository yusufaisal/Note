//
//  ViewController.swift
//  Note
//
//  Created by iSal on 21/08/20.
//  Copyright © 2020 iSal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var data:[NoteRecord] = [
        NoteRecord(title: "Diary", detail: "detail..."),
        NoteRecord(title: "Work Note", detail: "detail..."),
        NoteRecord(title: "Wishlist", detail: "detail...")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupTableView()
    }
    
    private func setupTableView(){
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    @IBAction func onAdd(_ sender: Any) {
        let alertController = UIAlertController(title: "Add Note", message: "", preferredStyle: .alert)
        let saveAction = UIAlertAction(title: "Save", style: .default) { (alert) in
            var title = ""
            var detail = ""
            
            if let titleTextfield = alertController.textFields?[0] {
                title = titleTextfield.text!
            }
            if let detailTexField = alertController.textFields?[1]{
                detail = detailTexField.text!
            }
            
            let note = NoteRecord(title: title, detail: detail)
            self.data.append(note)
            self.tableView.reloadData()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.addTextField { (textField) in
            textField.placeholder = "Title"
        }
        alertController.addTextField { (textField) in
            textField.placeholder = "Detail"
        }
        
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }
}

extension ViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        
        cell.textLabel?.text = data[index].title
        cell.detailTextLabel?.text = data[index].detail
        
        return cell
    }
    
    
}
