//
//  NoticeVC.swift
//  StudentAdmissionCoreDataApp
//
//  Created by DCS on 15/07/21.
//  Copyright © 2021 Vishal. All rights reserved.
//

import UIKit

class NoticeVC: UIViewController {

    
    
    private var noteArray = [Notice]()
    private let StudTableView = UITableView()
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        noteArray = CoreDataNoticeHandler.shared.fetch()
        StudTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Notice Board"
        self.view.backgroundColor = .white
        let addItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewStudent))
        view.addSubview(StudTableView)
        navigationItem.setRightBarButton(addItem, animated: true)
        setupTableView()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        StudTableView.frame = view.bounds
    }
    @objc private func addNewStudent() {
        
        let vc = addNewNoticeVC()
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
}


extension NoticeVC: UITableViewDataSource,UITableViewDelegate {
    
    private func setupTableView() {
        
        StudTableView.register(UITableViewCell.self, forCellReuseIdentifier: "note")
        StudTableView.delegate = self
        StudTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noteArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "note", for: indexPath)
        
        let note = noteArray[indexPath.row]
        cell.textLabel?.text = "\(note.name!) \t | \(note.notice!)"
        return cell
        
       
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc  = addNewNoticeVC()
        vc.notice = noteArray[indexPath.row]
        
        navigationController?.pushViewController(vc, animated: true)
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        
        let note = noteArray[indexPath.row]
        
        CoreDataNoticeHandler.shared.delete(note: note) { [weak self]  in
            self?.noteArray.remove(at:indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        
       
    }
}
}
