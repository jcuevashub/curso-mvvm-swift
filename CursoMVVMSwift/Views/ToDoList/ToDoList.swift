//
//  ToDoList.swift
//  CursoMVVMSwift
//
//  Created by Jackson Cuevas on 13/1/25.
//

import SwiftUI

struct ToDoList: View {
    @EnvironmentObject var viewModel: ToDoViewModel
    @State private var isPresented: Bool = false
    @State private var todoToPreview: ToDoEntity?
    
    private var unArchaivedToDos: [ToDoEntity] {
        viewModel.todos.filter{!$0.isArchived}
    }
    
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 8),
        GridItem(.flexible(), spacing: 8),
    ]
    
    var body: some View {
        ZStack(alignment: .center) {
            ScrollView {
                if !unArchaivedToDos.isEmpty {
                    LazyVGrid(columns: columns) {
                        ForEach(unArchaivedToDos) {todo in
                            ToDoItemView(todo: todo)
                                .onTapGesture {
                                    todoToPreview = todo
                                }
                        }
                    }.padding(.horizontal)
                } else {
                    NoToDosView(showedCreatingSheet: $isPresented)
                        .offset(y: UIScreen.main.bounds.height * 0.3)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .overlay {
                if isPresented {
                    ToDoSheet(isShow: $isPresented) {
                        ToDoAddView(isPresented: $isPresented)
                    }.ignoresSafeArea(.keyboard)
                } else if todoToPreview != nil {
                    ToDoPreviewView(todo: $todoToPreview)
                        .transition(AnyTransition.opacity.animation(.easeIn))
                }
            }
        }
        .navigationTitle("ToDos")
        .toolbar {
            ToolbarItem {
                HStack(spacing: 0) {
                    NavigationLink {
                        ToDoArchivedListView()
                    } label: {
                        Image(systemName: "trash")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundStyle(Color.primary)
                    }
                    Button {
                        isPresented.toggle()
                    } label: {
                        Image(systemName: "plus")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundStyle(Color.primary)
                    }
                }
            }
        }
        .navigationBarHidden(isPresented || (todoToPreview != nil))
    }
}

#Preview {
    NavigationView {
        ToDoList().environmentObject(ToDoViewModel())
    }
}
