//
//  HomeView.swift
//  NotesExample
//
//  Created by David Merchan on 21/12/24.
//

import SwiftUI

struct HomeView: View {
    
    @Environment(\.managedObjectContext) var context
    @StateObject var noteViewModel = NotesViewModel()
    @FetchRequest(entity: NoteEntity.entity(), sortDescriptors: [NSSortDescriptor(key: "date", ascending: true)], animation: .spring()) var myNotes : FetchedResults<NoteEntity>
    
    var body: some View {
        NavigationView {
            List {
                ForEach(myNotes) { item in
                    var formattedDate: String {
                            let formatter = DateFormatter()
                            formatter.dateStyle = .long
                            formatter.timeStyle = .short
                        return formatter.string(from: item.date ?? Date())
                        }
                    
                    VStack(alignment: .leading) {
                        Text(item.detail ?? "N/A")
                            .font(.headline)
                            .bold()
                        Text(formattedDate)
                    }.contextMenu(ContextMenu(menuItems: {
                        Button(action: {
                            noteViewModel.sendData(item: item)
                        }) {
                            Label("Editar", systemImage: "pencil")
                        }
                        Button(action: {
                            noteViewModel.deleteNote(context: context, note: item)
                        }) {
                            Label("Eliminar", systemImage: "trash")
                        }
                    }))
                }
            }.navigationTitle("Mis Notas")
                .navigationBarItems(trailing: HStack {
                    Button(action: {
                        noteViewModel.newNote()
                    }) {
                        Image(systemName: "plus")
                    }.sheet(isPresented: $noteViewModel.showAddNote) {
                        AddNoteView(noteModel: noteViewModel)
                    }
                })
        }
    }
}

#Preview {
    HomeView()
}
