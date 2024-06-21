//
//  TaskTableViewCell.swift
//  Minimal-To-do-List
//
//  Created by M7md  on 27/05/2024.
//

import UIKit
protocol TaskTableViewCellDelegate: AnyObject {
    func removeCell(_ cell: TaskTableViewCell)
}
class TaskTableViewCell: UITableViewCell {
    static let identifier = "TaskTableViewCell"
    weak var delegate: TaskTableViewCellDelegate?
    var wideConstraint: NSLayoutConstraint!
    var narrowConstraint: NSLayoutConstraint!
    private let taskView: UIView = {
        let taskView = UIView()
        taskView.layer.cornerRadius = 10
        taskView.layer.borderWidth = 0.5
        taskView.layer.borderColor = UIColor.init(netHex: 0xBABABA).cgColor
        taskView.translatesAutoresizingMaskIntoConstraints = false
        return taskView
    }()
    private let taskLabel: UILabel = {
        let task = UILabel()
        task.font = UIFont.systemFont(ofSize: 15)
        task.textColor = UIColor.init(netHex: 0xBABABA)
        task.translatesAutoresizingMaskIntoConstraints = false
        return task
    }()
    private let doneButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Done", for: .normal)
        btn.setTitleColor(UIColor.init(netHex: 0x202020), for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.layer.cornerRadius = 8
        btn.layer.borderWidth = 0.2
        btn.layer.borderColor = UIColor.gray.cgColor
        btn.backgroundColor = UIColor.init(netHex: 0xECBB5B)
        return btn
    }()
    private let removeTaskButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Remove", for: .normal)
        btn.setTitleColor(UIColor.init(netHex: 0x202020), for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.layer.cornerRadius = 8
        btn.layer.borderWidth = 0.2
        btn.layer.borderColor = UIColor.gray.cgColor
        btn.backgroundColor = UIColor.init(netHex: 0xC64444)
        return btn
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(taskView)
        taskView.addSubview(taskLabel)
        taskView.addSubview(doneButton)
        taskView.addSubview(removeTaskButton)
        applyConstraints()
        wideConstraint = doneButton.widthAnchor.constraint(equalToConstant: 70)
        narrowConstraint = doneButton.widthAnchor.constraint(equalToConstant: 50)
        removeTaskButton.addTarget(self, action: #selector(removeButtonTapped(_:)), for: .touchUpInside)
        doneButton.addTarget(self, action: #selector(doneButtonTapped(_:)), for: .touchUpInside)
    }
    required init?(coder: NSCoder) {
        fatalError("Error")
    }
    @objc func doneButtonTapped(_ sender: UIButton = UIButton()) {
        sender.backgroundColor = UIColor.init(netHex: 0xB29545)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            sender.backgroundColor = UIColor.init(netHex: 0xECBB5B)
        }
        let text = taskLabel.text!
        DataPersistence.shared.updateTaskState(text) { result in
            switch result {
            case .success:
                print("Updated")
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        if sender.title(for: .normal) == "Done" {
            narrowConstraint.isActive = false
            wideConstraint.isActive = true
            sender.setTitle("Undone", for: .normal)
            taskLabel.setStrikethroughText(text)
        } else {
            wideConstraint.isActive = false
            narrowConstraint.isActive = true
            sender.setTitle("Done", for: .normal)
            print(text)
            taskLabel.removeStrikethroughText()
            taskLabel.textColor = UIColor.init(netHex: 0xBABABA)
        }
    }
    @objc func removeButtonTapped(_ sender: UIButton = UIButton()) {
        sender.backgroundColor = UIColor.init(netHex: 0x8B3333)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            sender.backgroundColor = UIColor.init(netHex: 0xC64444)
        }
        delegate?.removeCell(self)
    }
    private func applyConstraints() {
        NSLayoutConstraint.activate([
            taskView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            taskView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            taskView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            taskView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            taskLabel.centerYAnchor.constraint(equalTo: taskView.centerYAnchor),
            taskLabel.leadingAnchor.constraint(equalTo: taskView.leadingAnchor, constant: 20),
            doneButton.centerYAnchor.constraint(equalTo: taskView.centerYAnchor),
            doneButton.leadingAnchor.constraint(equalTo: taskLabel.trailingAnchor, constant: 10),
            removeTaskButton.centerYAnchor.constraint(equalTo: taskView.centerYAnchor),
            removeTaskButton.leadingAnchor.constraint(equalTo: doneButton.trailingAnchor, constant: 10),
            removeTaskButton.trailingAnchor.constraint(equalTo: taskView.trailingAnchor, constant: -10),
            removeTaskButton.widthAnchor.constraint(equalToConstant: 70)
        ])
    }
    public func configura(_ task: RealmTaskModel) {
        taskLabel.text = task.taskName
        if task.taskDone {
            narrowConstraint.isActive = false
            wideConstraint.isActive = true
            doneButton.setTitle("Undone", for: .normal)
            taskLabel.setStrikethroughText(task.taskName!)
        } else {
            wideConstraint.isActive = false
            narrowConstraint.isActive = true
            doneButton.setTitle("Done", for: .normal)
            taskLabel.removeStrikethroughText()
            taskLabel.textColor = UIColor.init(netHex: 0xBABABA)
        }
    }
}
