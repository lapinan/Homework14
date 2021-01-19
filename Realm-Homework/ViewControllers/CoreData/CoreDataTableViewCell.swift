//
//  CoreDataTableViewCell.swift
//  Realm-Homework
//
//  Created by Андрей Лапин on 19.01.2021.
//

import UIKit

class CoreDataTableViewCell: UITableViewCell {
    
    var nameTaskLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Chalkduster", size: 100)
        label.numberOfLines = 0
        label.textColor = .red
        label.minimumScaleFactor = 0.1
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    var checkBox: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderColor = UIColor.black.cgColor
        view.backgroundColor = .darkGray
        view.layer.borderWidth = 2
        view.layer.masksToBounds = true
        return view
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(nameTaskLabel)
        addSubview(checkBox)
        setCheckBoxConstraints()
        setNameTaskLabelConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setNameTaskLabelConstraints() {
        nameTaskLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        nameTaskLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        nameTaskLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5).isActive = true
        nameTaskLabel.rightAnchor.constraint(equalTo: checkBox.leftAnchor, constant: -10).isActive = true
    }
    private func setCheckBoxConstraints() {
        checkBox.heightAnchor.constraint(equalToConstant: 22).isActive = true
        checkBox.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true
        checkBox.widthAnchor.constraint(equalToConstant: 22).isActive = true
        checkBox.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        DispatchQueue.main.async {
            self.checkBox.layer.cornerRadius = self.checkBox.frame.width / 2
        }
    }

}
