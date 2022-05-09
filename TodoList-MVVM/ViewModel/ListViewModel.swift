//
//  ListViewModel.swift
//  TodoList-MVVM
//
//  Created by NaheedPK on 19/04/2022.
//

import Foundation

class ListViewModel: ObservableObject {
    @Published var items: [ListModel] = [] {
        didSet {
            saveItems()
        }
    }
    let item_key = "items_key"
    init(){
        getItems()
    }
    
    private func getItems() {
//        let items = [
//            ListModel(title: "My first title!", isCompleted: false),
//            ListModel(title: "My second title!", isCompleted: false),
//            ListModel(title: "My third title!", isCompleted: true)
//        ]
//        self.items.append(contentsOf: items)
        guard let items = UserDefaults.standard.data(forKey: item_key),
              let decodedData = try? JSONDecoder().decode([ListModel].self, from: items) else {
            return
        }
        self.items = decodedData
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
    
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: item_key)
        }
    }
}
