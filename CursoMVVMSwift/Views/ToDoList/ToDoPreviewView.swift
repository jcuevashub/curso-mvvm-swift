//
//  ToDoPreviewView.swift
//  CursoMVVMSwift
//
//  Created by Jackson Cuevas on 15/1/25.
//

import SwiftUI

struct ToDoPreviewView: View {
    @EnvironmentObject private var viewModel: ToDoViewModel
    @Binding public var todo: ToDoEntity?
    @State private var showedTodoCreationSheet: Bool = false
    
    var body: some View {
        if let safeTodo = todo {
            
            ZStack(alignment: .bottom) {
                Rectangle().fill(.thinMaterial)
                    .ignoresSafeArea()
                    .onTapGesture {pGesture in
                        
                    }
                
                VStack(spacing: 36) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text(Date(),
                                 format: .dateTime.weekday(.wide)
                                .day()
                                .month()
                                .year()
                                .hour()
                                .minute())
                            
                            Text("")
                                .font(.title3)
                                .fontWeight(.bold)
                        }
                        Spacer()
                    }
                    if let note = safeTodo.note, !note.isEmpty {
                        Text(note)
                            .multilineTextAlignment(.leading)
                    }
                    
                    HStack(spacing: 16) {
                        Button {
                            
                        } label: {
                            Text("Editar")
                                .frame(maxWidth: .infinity)
                                .font(.headline)
                                .foregroundStyle(Color.primary)
                                .padding(.vertical, 8)
                                .padding(.horizontal, 32)
                                .overlay {
                                    Capsule(style: .circular)
                                        .stroke(Color.primary, lineWidth: 1)
                                }
                            
                        }
                        Spacer()
                        Button {
                            
                        } label: {
                            Text("Archivar")
                                .frame(maxWidth: .infinity)
                                .font(.headline)
                                .foregroundStyle(Color.primary)
                                .padding(.vertical, 8)
                                .padding(.horizontal, 32)
                                .overlay {
                                    Capsule(style: .circular)
                                        .stroke(Color.primary, lineWidth: 1)
                                }
                        }
                    }
                    
                }.frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.indigo)
                    .clipShape(.rect(cornerRadius: 10))
                    .padding(8)
                
                
            }
            .frame(maxWidth: UIScreen.main.bounds.width)
            .frame(maxHeight: UIScreen.main.bounds.height)
            .zIndex(2)
            .overlay {
                
            }
            
        } else {
            EmptyView()
        }
    }
}

//#Preview {
//    ToDoPreviewView(todo:).environmentObject(ToDoViewModel())
//}
