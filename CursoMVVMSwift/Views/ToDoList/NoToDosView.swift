//
//  NoToDosView.swift
//  CursoMVVMSwift
//
//  Created by Jackson Cuevas on 17/1/25.
//

import SwiftUI

struct NoToDosView: View {
    @Binding var showedCreatingSheet: Bool
    
    
    var body: some View {
     VStack {
            Text("No hay tareas")
             .font(.title2)
         Button {
             
         } label: {
             Text("Intenta crear una tarea.")
                 .font(.headline)
                 .foregroundColor(Color.teal)
         }
        }
    }
}

#Preview {
    NoToDosView(
        showedCreatingSheet: .constant(false)
    )
}
