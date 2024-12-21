//
//  AddNoteView.swift
//  NotesExample
//
//  Created by David Merchan on 21/12/24.
//

import SwiftUI

struct AddNoteView: View {
    
    @Environment(\.managedObjectContext) var context
    @ObservedObject var noteModel: NotesViewModel
    
    var body: some View {
        VStack {
            Text(noteModel.updateNote != nil ? "Editar nota" : "Agregar una nota")
                .font(.largeTitle)
                .bold()
            Spacer()
            TextEditor(text: $noteModel.note)
            Divider()
            DatePicker("Seleccionar una fecha", selection: $noteModel.date)
            Spacer()
            Divider()
            Button(action: {
                if noteModel.updateNote != nil {
                    noteModel.updateNote(context: context)
                } else {
                    noteModel.saveNote(context: context)
                }
            }) {
                Label(
                    title: { Text(noteModel.updateNote != nil ? "Actualizar" : "Guardar") },
                    icon: { Image(systemName: "plus") }
                ).foregroundStyle(.white)
            }.padding(20)
                .frame(width: UIScreen.main.bounds.width - 30)
                .background(noteModel.note.isEmpty ? .gray : .blue)
                .cornerRadius(8)
                .disabled(noteModel.note.isEmpty)
            
        }.padding(20)
    }
}

#Preview {
    AddNoteView(noteModel: NotesViewModel())
}
