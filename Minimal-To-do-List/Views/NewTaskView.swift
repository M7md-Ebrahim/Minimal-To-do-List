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
        textField.returnKeyType = .done
        return textField
    }()
    private let addTaskButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Add Task", for: .normal)
        btn.setTitleColor(UIColor.init(netHex: 0x202020), for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.layer.cornerRadius = 10
        btn.layer.borderWidth = 0.2
        btn.backgroundColor = UIColor.init(netHex: 0x626ED9)
        btn.layer.borderColor = UIColor.white.cgColor
        return btn
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(taskTextField)
        addSubview(addTaskButton)
        taskTextField.delegate = self
        backgroundColor = UIColor.init(netHex: 0x202020)
        applyConstraints()
        addTaskButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
    }
    @objc func buttonTapped(_ sender: UIButton = UIButton()) {
        sender.backgroundColor = UIColor.init(netHex: 0x3B4EB5)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            sender.backgroundColor = UIColor.init(netHex: 0x626ED9)
        }
        guard let text = taskTextField.text, !text.isEmpty else {return}
        let task = TaskModel(taskName: text, taskDone: false)
        DataPersistence.shared.createTask(task) { result in
            switch result {
            case .success:
                NotificationCenter.default.post(name: NSNotification.Name("Task"), object: nil)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        taskTextField.text = ""
        taskTextField.endEditing(true)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func applyConstraints() {
        NSLayoutConstraint.activate([
            taskTextField.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            taskTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            taskTextField.heightAnchor.constraint(equalToConstant: 60),
            taskTextField.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.6),
            addTaskButton.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            addTaskButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            addTaskButton.heightAnchor.constraint(equalToConstant: 60),
            addTaskButton.leadingAnchor.constraint(equalTo: taskTextField.trailingAnchor, constant: 10),
            addTaskButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.27)
        ])
    }
}

extension NewTaskView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        buttonTapped()
        return true
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        taskTextField.endEditing(true)
    }
}
