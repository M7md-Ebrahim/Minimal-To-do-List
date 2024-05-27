//
//  TaskTableViewCell.swift
//  Minimal-To-do-List
//
//  Created by M7md  on 27/05/2024.
//

import UIKit

class TaskTableViewCell: UITableViewCell {
    static let identifier = "TaskTableViewCell"
    private let taskView: UIView = {
        let taskView = UIView()
        taskView.layer.cornerRadius = 10
        taskView.layer.borderWidth = 0.2
        taskView.layer.borderColor = UIColor.label.cgColor
        taskView.translatesAutoresizingMaskIntoConstraints = false
        return taskView
    }()
    private let taskLabel: UILabel = {
        let task = UILabel()
        task.translatesAutoresizingMaskIntoConstraints = false
        return task
    }()
    private let done: UIButton = {
        let btn = UIButton()
        btn.setTitle("Done", for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.layer.cornerRadius = 8
        btn.backgroundColor = .systemRed
        return btn
    }()
    private let removetask: UIButton = {
        let btn = UIButton()
        btn.setTitle("Remove", for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.layer.cornerRadius = 8
        btn.backgroundColor = .systemRed
        return btn
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(taskView)
        taskView.addSubview(taskLabel)
        taskView.addSubview(done)
        taskView.addSubview(removetask)
        applyConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("Error")
    }
    private func applyConstraints() {
        NSLayoutConstraint.activate([
            taskView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            taskView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            taskView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            taskView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            taskLabel.centerYAnchor.constraint(equalTo: taskView.centerYAnchor),
            taskLabel.leadingAnchor.constraint(equalTo: taskView.leadingAnchor, constant: 20),
            done.centerYAnchor.constraint(equalTo: taskView.centerYAnchor),
            done.leadingAnchor.constraint(equalTo: taskLabel.trailingAnchor, constant: 40),
            done.widthAnchor.constraint(equalToConstant: 50),
            removetask.centerYAnchor.constraint(equalTo: taskView.centerYAnchor),
            removetask.leadingAnchor.constraint(equalTo: done.trailingAnchor, constant: 10),
            removetask.trailingAnchor.constraint(equalTo: taskView.trailingAnchor, constant: -10),
            removetask.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
}
