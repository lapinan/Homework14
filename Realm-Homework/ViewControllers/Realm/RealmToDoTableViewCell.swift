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
        checkbox.isOn = false
        checkbox.onTintColor = .red
        checkbox.translatesAutoresizingMaskIntoConstraints = false
        return checkbox
    }()
    var title: UILabel = {
        let label = UILabel()
        label.textColor = .red
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.1
        label.numberOfLines = 0
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(title)
        addSubview(checkBox)
        
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
        checkBox.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true
        checkBox.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        checkBox.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 10).isActive = true
        checkBox.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/5).isActive = true
    }
    
}
