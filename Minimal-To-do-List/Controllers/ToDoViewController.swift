//
//  ViewController.swift
//  Minimal-To-do-List
//
//  Created by M7md  on 27/05/2024.
//

import UIKit

class ToDoViewController: UIViewController {
    let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "Daily Todo's"
        titleLabel.textColor = UIColor.init(netHex: 0xBABABA)
        titleLabel.font = UIFont(name: "Rubik-Regular", size: 35)
        titleLabel.textAlignment = .center
        titleLabel.clipsToBounds = true
        titleLabel.adjustsFontSizeToFitWidth = true
        return titleLabel
    }()
    private let tasksTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(TaskTableViewCell.self, forCellReuseIdentifier: TaskTableViewCell.identifier)
        tableView.backgroundColor = UIColor.init(netHex: 0x202020)
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        return tableView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.titleView = titleLabel
        view.backgroundColor = UIColor.init(netHex: 0x202020)
        navigationController?.navigationBar.backgroundColor = UIColor.init(netHex: 0x202020)
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

extension ToDoViewController: UITableViewDataSource, UITableViewDelegate {
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
        return 80
    }
}
