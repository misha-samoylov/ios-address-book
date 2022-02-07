//
//  DetailsViewController.swift
//  AddressBook
//
//  Created by Misha Samoylov on 07.02.2022.
//

import UIKit

class DetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var tableView : UITableView = UITableView()
    var contact: Contact!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = contact.name
               
        self.tableView = UITableView(frame: .zero, style: UITableView.Style.grouped)
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        self.view.addSubview(tableView)
        tableView.backgroundColor = UIColor.systemGray5
        
        tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        // set delegate and datasource
        tableView.delegate = self
        tableView.dataSource = self
    
        self.view.backgroundColor = UIColor.white
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (section == 0) {
            return 2
        }
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let cell = UITableViewCell(style: .value2, reuseIdentifier: "cell")
        
        
        if (indexPath.section == 0) {
            if (indexPath.row == 0) {
                cell.textLabel?.text = "Имя"
                cell.detailTextLabel?.text = "\(contact.name)"
            }
            if (indexPath.row == 1) {
                cell.textLabel?.text = "Фамилия"
                cell.detailTextLabel?.text = "\(contact.surname)"
            }
        }
        
        if (indexPath.section == 1) {
            cell.textLabel?.text = "Сотовый"
            cell.detailTextLabel?.text = "\(contact.number)"
        }
        
        if (indexPath.section == 2) {
            cell.textLabel?.text = "О себе"
            cell.detailTextLabel?.text = "\(contact.about)"
        }
            
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Общее"
        }
        
        if section == 1 {
            return "Номер"
        }
        
        if section == 2 {
            return "Информация"
        }
        
        return ""
    }
}
