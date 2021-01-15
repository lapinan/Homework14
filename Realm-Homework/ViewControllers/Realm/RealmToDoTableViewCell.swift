//
//  RealmToDoTableViewCell.swift
//  Realm-Homework
//
//  Created by Андрей Лапин on 15.01.2021.
//

import UIKit

class RealmToDoTableViewCell: UITableViewCell {
    
    var checkBox: UISwitch = {
        let checkbox = UISwitch()
        checkbox.isOn = true
        checkbox.onTintColor = .red
        checkbox.translatesAutoresizingMaskIntoConstraints = false
        return checkbox
    }()
    var title: UILabel = {
        let label = UILabel()
        label.textColor = .red
        label.font = UIFont(name: "Chalkduster", size: 100)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 0
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setTitleConstraints()
        setCheckBoxConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setTitleConstraints() {
        title.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        title.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        title.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        title.rightAnchor.constraint(equalTo: checkBox.leftAnchor, constant: -20).isActive = true
    }
    private func setCheckBoxConstraints() {
        checkBox.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        checkBox.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        checkBox.widthAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
}
