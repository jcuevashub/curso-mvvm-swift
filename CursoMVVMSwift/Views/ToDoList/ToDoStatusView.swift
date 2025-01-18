//
//  ToDoStatusView.swift
//  CursoMVVMSwift
//
//  Created by Jackson Cuevas on 17/1/25.
//

import SwiftUI

struct ToDoStatusView: View {
    @EnvironmentObject private var viewModel: ToDoViewModel
    public let todo: ToDoEntity
    
    public let disabled: Bool
    
    init(todo: ToDoEntity, disabled: Bool = false) {
        self.todo = todo
        self.disabled = disabled
    }
    
    var body: some View {
        let imageName: String = todo.isCompleted ? "checkmark.circle.fill" : "circle"
        let width: CGFloat = todo.isCompleted ? 22 : 24
        let height: CGFloat = width
        
        return Image(systemName: imageName)
            .resizable()
            .frame(width: width)
            .frame(height: height)
            .onTapGesture {
                viewModel.updateTodoStatus(todo)
                
            }.disabled(disabled)
    }
}

#Preview {
    //ToDoStatusView()
}
