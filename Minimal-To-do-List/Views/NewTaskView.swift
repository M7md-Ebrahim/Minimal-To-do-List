//
//  NewTaskView.swift
//  Minimal-To-do-List
//
//  Created by M7md  on 27/05/2024.
//

import UIKit

class NewTaskView: UIView {
    private let taskTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Add a task"
        textField.textColor = UIColor.init(netHex: 0xBABABA)
        textField.backgroundColor = .systemGray6
        textField.font = .systemFont(ofSize: 22, weight: .medium)
        textField.layer.cornerRadius = 10
        textField.layer.borderWidth = 0.2
        textField.layer.borderColor = UIColor.white.cgColor
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textField.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textField.rightViewMode = .always
        textField.leftViewMode = .always
        return textField
    }()
    private let addTaskButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Add Task", for: .normal)
        btn.setTitleColor(UIColor.init(netHex: 0x202020), for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.layer.cornerRadius = 10
        btn.backgroundColor = UIColor.init(netHex: 0x626ED9)
        btn.setTitleColor(.white, for: .highlighted)
        return btn
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(taskTextField)
        addSubview(addTaskButton)
        backgroundColor = UIColor.init(netHex: 0x202020)
        applyConstraints()
        addTaskButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
    }
    @objc func buttonTapped(_ sender: UIButton) {
        sender.backgroundColor = UIColor.init(netHex: 0x3B4EB5)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            sender.backgroundColor = UIColor.init(netHex: 0x626ED9)
        }
        guard let text = taskTextField.text else {return}
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func applyConstraints() {
        NSLayoutConstraint.activate([
            taskTextField.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            taskTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            taskTextField.heightAnchor.constraint(equalToConstant: 65),
            taskTextField.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.6),
            addTaskButton.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            addTaskButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            addTaskButton.heightAnchor.constraint(equalToConstant: 65),
            addTaskButton.leadingAnchor.constraint(equalTo: taskTextField.trailingAnchor, constant: 10),
            addTaskButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.27)
        ])
    }
}
