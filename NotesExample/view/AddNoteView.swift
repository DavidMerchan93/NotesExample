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
            Text("Agregar una nota")
                .font(.largeTitle)
                .bold()
            Spacer()
            TextEditor(text: $noteModel.note)
            Divider()
            DatePicker("Seleccionar una fecha", selection: $noteModel.date)
            Spacer()
            Divider()
            Button(action: {
                noteModel.saveNote(context: context)
            }) {
                Label(
                    title: { Text("Guardar") },
                    icon: { Image(systemName: "plus") }
                ).foregroundStyle(.white)
            }.padding(20)
                .frame(width: UIScreen.main.bounds.width - 30)
                .background(.blue)
                .cornerRadius(8)
            
        }.padding(20)
    }
}

#Preview {
    AddNoteView(noteModel: NotesViewModel())
}
