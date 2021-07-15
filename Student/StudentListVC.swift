//
//  StudentListVC.swift
//  StudentAdmissionCoreDataApp
//
//  Created by DCS on 14/07/21.
//  Copyright © 2021 Vishal. All rights reserved.
//

import UIKit

class StudentListVC: UIViewController {

    
    private var studArray = [Students]()
    private let StudTableView = UITableView()
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        studArray = CoreDataHandler.shared.fetch()
        StudTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Students"
        self.view.backgroundColor = .white
        let addItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewStudent))
        view.addSubview(StudTableView)
        navigationItem.setRightBarButton(addItem, animated: true)
        
        
        self.view.backgroundColor = .white
        
        setupTableView()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        StudTableView.frame = view.bounds
    }
    @objc private func addNewStudent() {
        
        let vc = addStudVC()
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
}


extension StudentListVC: UITableViewDataSource,UITableViewDelegate {
    
    private func setupTableView() {
        
        StudTableView.register(UITableViewCell.self, forCellReuseIdentifier: "stud")
        StudTableView.delegate = self
        StudTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "stud", for: indexPath)
        
        let stud = studArray[indexPath.row]
        cell.textLabel?.text = "\(stud.spid!) \t | \(stud.name!) \t | \(stud.clas!) \t | \(stud.div!) \t | \(stud.sem) | \t \(stud.mobileno!) \t | \(stud.password!)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc  = addStudVC()
        vc.students = studArray[indexPath.row]
        
        navigationController?.pushViewController(vc, animated: true)
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        let stud = studArray[indexPath.row]
        
        CoreDataHandler.shared.delete(stud: stud) { [weak self]  in
            self?.studArray.remove(at:indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            
        }
        
    
    }
}
