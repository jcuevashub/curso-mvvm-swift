//
//  ToDoNoArchivedView.swift
//  CursoMVVMSwift
//
//  Created by Jackson Cuevas on 17/1/25.
//

import SwiftUI

struct ToDoNoArchivedView: View {
    @Environment(\.dismiss) var dismiss
    
    
    var body: some View {
        VStack {
            Text("No hay notas archivadas.")
                .font(.title2)
            
            Button {
                dismiss()
            } label: {
                Text("Ver todas las notas")
                    .font(.headline)
                    .foregroundStyle(Color.teal)
            }
        }
        .multilineTextAlignment(.center)
        .frame(maxWidth: 200)
    }
}

#Preview {
    ToDoNoArchivedView()
}
