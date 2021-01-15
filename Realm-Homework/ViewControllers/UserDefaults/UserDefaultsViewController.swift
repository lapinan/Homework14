//
//  UserDefaultsViewController.swift
//  Realm-Homework
//
//  Created by Андрей Лапин on 15.01.2021.
//

import UIKit

class UserDefaultsViewController: UIViewController {
    
    lazy var textFieldStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillEqually
        stack.axis = .vertical
        stack.spacing = 20.0
        stack.addArrangedSubview(nameTextField)
        stack.addArrangedSubview(secondNameTextField)
        return stack
    }()
    lazy var labelStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 10.0
        return stack
    }()
    let nameTextField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .roundedRect
        tf.adjustsFontSizeToFitWidth = true
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.addTarget(self, action: #selector(nameTextFieldPressed), for: .editingChanged)
        return tf
    }()
    let secondNameTextField: UITextField = {
        let tf = UITextField()
        tf.adjustsFontSizeToFitWidth = true
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.addTarget(self, action: #selector(secondNameTextFieldPressed), for: .editingChanged)
        return tf
    }()
    let nameLabel: UILabel = {
        let label = UILabel()
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.1
        label.numberOfLines = 0
        label.font = UIFont(name: "Chalkduster", size: 100)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let secondName: UILabel = {
        let label = UILabel()
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.1
        label.numberOfLines = 0
        label.font = UIFont(name: "Chalkduster", size: 100)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
        
        setTextFieldStackViewConstraints()
        setLabelStackViewConstraints()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    //MARK: Constraints
    private func setTextFieldStackViewConstraints() {
        textFieldStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        textFieldStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        textFieldStackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        textFieldStackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/10).isActive = true
    }
    private func setLabelStackViewConstraints() {
        labelStackView.topAnchor.constraint(equalTo: textFieldStackView.bottomAnchor, constant: 20).isActive = true
        labelStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        labelStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        labelStackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/15).isActive = true
    }
    
    //MARK: Actinos
    @objc private func nameTextFieldPressed(_ sender: UITextField) {
        nameLabel.text = nameTextField.text!
    }
    @objc private func secondNameTextFieldPressed(_ sender: UITextField) {
        secondName.text = secondNameTextField.text!
    }
}
