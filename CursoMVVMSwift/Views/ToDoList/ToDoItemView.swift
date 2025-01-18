//
//  ToDoItemView.swift
//  CursoMVVMSwift
//
//  Created by Jackson Cuevas on 15/1/25.
//

import SwiftUI

struct ToDoItemView: View {
    @EnvironmentObject private var viewModel: ToDoViewModel
    public let todo: ToDoEntity
    
    var body: some View {
        if ((todo.id?.isEmpty) != nil) {
            VStack(alignment: .leading, spacing: 8 ) {
                HStack(alignment: .top, spacing: 4) {
                    Text(todo.date!, format: .dateTime.day())
                        .font(.system(size: 44, weight: .semibold))
                        .padding(.top, -8)
                    VStack(alignment: .leading, spacing: 8) {
                        Text(todo.date!, format: .dateTime.month())
                            .fontWeight(.semibold)
                        Text(todo.date!, format: .dateTime.weekday(.abbreviated))
                            .fontWeight(.semibold)
                    }.padding(.top, -8)
                    Spacer(minLength: 2)
                    ToDoStatusView(todo: todo)
                }
                VStack(alignment: .leading) {
                    Text(todo.title!)
                        .font(.title)
                        .fontWeight(.bold)
                        .lineLimit(2)
                    if let description = todo.note {
                        Text(description)
                            .font(.caption)
                            .fontWeight(.light)
                            .lineLimit(3)
                    }
                }
                Spacer(minLength: 2)
                HStack(spacing: 4) {
                    Text("Hora:")
                    Text(todo.date!, format: .dateTime.hour().minute())
                        .fontWeight(.thin)
                }
            }
            .padding()
            .background(Color.indigo)
            .clipShape(.rect(cornerRadius: 10))
            
        } else {
            EmptyView()
        }
    }
}

#Preview {
    ToDoItemView(todo: ToDoEntity()).environmentObject(ToDoViewModel())
}
