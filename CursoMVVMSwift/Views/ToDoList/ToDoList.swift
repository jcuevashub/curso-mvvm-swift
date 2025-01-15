//
//  ToDoList.swift
//  CursoMVVMSwift
//
//  Created by Jackson Cuevas on 13/1/25.
//

import SwiftUI

struct ToDoList: View {
    @State private var isPresented: Bool = false
    
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 8),
        GridItem(.flexible(), spacing: 8),
    ]
    
    var body: some View {
        ZStack(alignment: .center) {
            ScrollView {
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .overlay {
                if isPresented {
                    ToDoSheet(isShow: $isPresented) {
                        ToDoAddView(isPresented: $isPresented)
                    }.ignoresSafeArea(.keyboard)
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
    }
}

#Preview {
    NavigationView {
        ToDoList().environmentObject(ToDoViewModel())
    }
}
