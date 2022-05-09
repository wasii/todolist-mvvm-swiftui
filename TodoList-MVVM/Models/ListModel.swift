//
//  ListModel.swift
//  TodoList-MVVM
//
//  Created by NaheedPK on 19/04/2022.
//

import Foundation

struct ListModel: Identifiable, Codable {
    let id: String
    let title: String
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func updateCompletion() -> ListModel {
        return ListModel(id: id, title: title, isCompleted: !isCompleted)
    }
}
