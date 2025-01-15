//
//  ToDoPersistenceManager.swift
//  CursoMVVMSwift
//
//  Created by Jackson Cuevas on 14/1/25.
//

import CoreData

final class ToDoPersistenceManager {
    static let shared = ToDoPersistenceManager()
    
    let container: NSPersistentContainer
    
    private init() {
        container = NSPersistentContainer(name: "ModelData")
        container.loadPersistentStores { storeDescription, error in
            if let error = error {
                fatalError("Failed to load persistent stores: \(error)")
            } else {
                print("Carga de datos exitosa.!")
            }
        }
    }
}
