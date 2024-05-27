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
        taskView.layer.cornerRadius = 12
        taskView.layer.borderColor = UIColor.gray.cgColor
        taskView.layer.masksToBounds = true
        taskView.translatesAutoresizingMaskIntoConstraints = false
        return taskView
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    required init?(coder: NSCoder) {
        fatalError("Error")
        contentView.addSubview(taskView)
        NSLayoutConstraint.activate([
            taskView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            taskView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            taskView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            taskView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
        ])
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        taskView.layer.borderWidth = 1.0
        taskView.layer.borderColor = UIColor.gray.cgColor
        
    }
}
