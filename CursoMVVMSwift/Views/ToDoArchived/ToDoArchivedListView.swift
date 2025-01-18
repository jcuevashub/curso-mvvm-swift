//
//  ToDoArchivedListView.swift
//  CursoMVVMSwift
//
//  Created by Jackson Cuevas on 13/1/25.
//

import SwiftUI

struct ToDoArchivedListView: View {
    @EnvironmentObject var viewModel: ToDoViewModel
    
    private var archivedToDos: [ToDoEntity] {
        viewModel.todos.filter{ $0.isArchived}
    }
    
    var body: some View {
        ScrollView {
            if !archivedToDos.isEmpty {
                ForEach(archivedToDos) { todo in
                    ZStack {
                        ToDoArchivedItemView(todo: todo)
                    }.padding(.horizontal)
                }
            } else {
                ToDoNoArchivedView()
                    .offset(y: UIScreen.main.bounds.height * 0.35)
            }
        }
        .padding(.top, 25)
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Archivados")
    }
}

#Preview {
    ToDoArchivedListView()
        .environmentObject(ToDoViewModel())
}
