//
//  ToDoAddView.swift
//  CursoMVVMSwift
//
//  Created by Jackson Cuevas on 13/1/25.
//

import SwiftUI

struct ToDoAddView: View {
    var body: some View {
        VStack(spacing: 16) {
            Spacer()
            
            Button {
                
            } label: {
                Text("Guardar".uppercased())
                    .font(.headline)
                    .tint(Color.primary)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .clipShape(.rect(cornerRadius: 10))
            }
        }
    }
}

#Preview {
    ToDoAddView()
}
