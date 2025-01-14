//
//  ToDoViewModel.swift
//  CursoMVVMSwift
//
//  Created by Jackson Cuevas on 14/1/25.
//

import Foundation
import CoreData
import Combine

public final class ToDoViewModel: ObservableObject {
    @Published private(set) var todos: [ToDoEntity] = []
    var cancellables: Set<AnyCancellable> = []
    private var storeContainer: NSPersistentContainer {
        return ToDoPersistenceManager.shared.container
    }
    
    init() {
        fetchTodos()
    }
    
    private func fetchTodos() {
        do {
            let request: NSFetchRequest<ToDoEntity> = ToDoEntity.fetchRequest()
            let sortDescription = NSSortDescriptor(key: "date", ascending: true)
            request.sortDescriptors = [sortDescription]
            request.returnsObjectsAsFaults = false
            todos = try storeContainer.viewContext.fetch(request)
        } catch {
            print("Error al recuperar los datos")
        }
    }
    
    private func saveTodo() {
        do {
            try storeContainer.viewContext.save()
            fetchTodos()
        } catch {
            print("Error al guardar los datos.")
        }
    }
    
    private func getToDoIndex(_ todo: ToDoEntity) -> Int? {
        guard
            let index = todos.firstIndex(where: {$0.id == todo.id})
        else {
            return nil
        }
        return index
    }
    
    private func validateInput(_ input: String) -> Bool {
        guard input.trimmingCharacters(in: .whitespaces).count > 2 else {
            return false
        }
        return true
    }
    
    public func addTodo(_ input: String) {
        guard validateInput(input) else {
            return
        }
        let todo = ToDoEntity(context: storeContainer.viewContext)
        todo.title = input
        todo.date = Date()
        saveTodo()
    }
    
    public func updateTodo(_ todo: ToDoEntity, _ input: String) {
        guard validateInput(input) else {
            return
        }
        todo.title = input
        saveTodo()
    }
    
    public func archiveTodo(_ todo: ToDoEntity) {

    }
    
    
    public func updateTodoStatus(_ todo: ToDoEntity) {
        
    }
    
    public func deleteTodo(_ todo: ToDoEntity) {

    }
    
}
