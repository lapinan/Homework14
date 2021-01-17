//
//  RealmModels.swift
//  Realm-Homework
//
//  Created by Андрей Лапин on 17.01.2021.
//

import Foundation
import RealmSwift

class TaskRealm: Object {
    @objc dynamic var title = ""
    @objc dynamic var isCheckBox = false
}
