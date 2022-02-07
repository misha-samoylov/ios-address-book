//
//  MainViewController.swift
//  AddressBook
//
//  Created by Misha Samoylov on 07.02.2022.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var tableView : UITableView = UITableView()
    var contacts: [Contact] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contacts.append(Contact(id: 0, name: "Валентин", surname: "Пирогов", number: "89007006655", about: "Механик"))
        
        contacts.append(Contact(id: 1, name: "Геннадий", surname: "Кириллов", number: "89007006655", about: "Директор"))
        
        contacts.append(Contact(id: 2, name: "Елена", surname: "Виноградова", number: "89007006655", about: "Владелец СТО"))
        
        contacts.append(Contact(id: 2, name: "Владимир", surname: "Колесников", number: "89007006655", about: "Бухгалтер"))

        self.navigationItem.title = "Записная книга"
        
        tableView = UITableView(frame: .zero, style: UITableView.Style.plain)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        tableView.backgroundColor = UIColor.systemGray5
        
        self.view.addSubview(tableView)
        
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
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "\(contacts[indexPath.row].name) \(contacts[indexPath.row].surname)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailsViewController()
        vc.contact = contacts[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }

}
