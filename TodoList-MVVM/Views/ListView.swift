//
//  ListView.swift
//  TodoList-MVVM
//
//  Created by NaheedPK on 08/04/2022.
//

import SwiftUI

struct ListView: View {
    @State var items: [String] = [
        "My first title!",
        "My second title!",
        "My third title!",
    ]
    var body: some View {
        List {
            ForEach(items, id: \.self) { item in
                ListRowView(title: item)
            }
            
        }
        .listStyle(PlainListStyle())
        .navigationTitle("Todo List 📝")
        .navigationBarItems(
            leading: EditButton(),
            trailing: NavigationLink("Add", destination: {
                AddNewItem()
            })
        )
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
    }
}
