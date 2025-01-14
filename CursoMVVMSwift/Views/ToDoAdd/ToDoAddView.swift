//
//  ToDoAddView.swift
//  CursoMVVMSwift
//
//  Created by Jackson Cuevas on 13/1/25.
//

import SwiftUI

struct ToDoAddView: View {
    //@Environment var viewModel: ToDoViewModel
    @Binding var isPresented: Bool
    
    @State var title: String = ""
    @State var note: String = ""
    @State var date: Date = Date()
    
    public var todo: ToDoEntity? = nil
    
    private let dateRange: ClosedRange<Date> = {
      let calendar = Calendar.current
        let startDate = Date.now
        let endDate = calendar.date(
            byAdding: .year,
            value: 10,
            to: startDate
        ) ?? startDate
        
        return startDate...endDate
    }()
    
    var body: some View {
        VStack(spacing: 16) {
            ToDoTextInput(
                "Ingrese nombre de la tarea",
                text: $title,
                label: "Tarea")
            ToDoTextInput(
                "Ingrese nota",
                text: $note,
                label: "Nota")
            
            DatePicker(
                selection: $date,
                in: dateRange
            ) {
                Text("Fecha y hora")
                    .font(.title3)
            }
            .tint(Color.secondary)
            .padding(.vertical, 8)
            
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
    ToDoAddView(isPresented: .constant(true))
}
