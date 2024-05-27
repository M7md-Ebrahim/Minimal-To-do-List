//
//  ViewController.swift
//  Minimal-To-do-List
//
//  Created by M7md  on 27/05/2024.
//

import UIKit

class ToDoViewController: UIViewController {
    private let tasksTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(TaskTableViewCell.self, forCellReuseIdentifier: TaskTableViewCell.identifier)
        return tableView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        title = "Daily Todo's"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        tasksTableView.delegate = self
        tasksTableView.dataSource = self
        view.addSubview(tasksTableView)
        tasksTableView.tableHeaderView = NewTaskView(frame: CGRect(x: 0, y: 0, width: Int(view.bounds.width), height: 120))
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tasksTableView.frame = view.bounds
    }
}

extension ToDoViewController:UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 40
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TaskTableViewCell.identifier, for: indexPath)as? TaskTableViewCell else {
            return UITableViewCell()
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
