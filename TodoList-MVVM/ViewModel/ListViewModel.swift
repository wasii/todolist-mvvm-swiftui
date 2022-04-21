//
//  ListViewModel.swift
//  TodoList-MVVM
//
//  Created by NaheedPK on 19/04/2022.
//

import Foundation

class ListViewModel: ObservableObject {
    @Published var items: [ListModel] = []
    
    init(){
        getItems()
    }
    
    private func getItems() {
        let items = [
            ListModel(title: "My first title!", isCompleted: false),
            ListModel(title: "My second title!", isCompleted: false),
            ListModel(title: "My third title!", isCompleted: true)
        ]
        self.items.append(contentsOf: items)
    }
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String) {
        let newItem = ListModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func updateItem(item: ListModel) {
        if let index = items.firstIndex(where: {$0.id == item.id}) {
            items[index] = item.updateCompletion()
        }
    }
}
