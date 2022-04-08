//
//  AddNewItem.swift
//  TodoList-MVVM
//
//  Created by NaheedPK on 08/04/2022.
//

import SwiftUI

struct AddNewItem: View {
    @State var addNewItemText: String = ""
    var body: some View {
        ScrollView {
            VStack {
                TextField("Add new item....!", text: $addNewItemText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(red: 242/255, green: 242/255, blue: 242/255))
                    .cornerRadius(10)
                
                Button {
                    
                } label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                    
                }

            }
            .padding(14)
            
        }
        .navigationTitle("Add new item.. 🖋")
    }
}

struct AddNewItem_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddNewItem()
        }
    }
}
