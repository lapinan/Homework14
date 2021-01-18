//
//  ForecastTableViewCell.swift
//  Realm-Homework
//
//  Created by Андрей Лапин on 17.01.2021.
//

import UIKit

class ForecastTableViewCell: UITableViewCell {
    
    let titleTempLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = label.font.withSize(100)
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.1
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(titleTempLabel)
        setTitleTempLabelConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setTitleTempLabelConstraints() {
        titleTempLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        titleTempLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        titleTempLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        titleTempLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5).isActive = true
    }
    
}
