//
//  HomeView.swift
//  NotesExample
//
//  Created by David Merchan on 21/12/24.
//

import SwiftUI

struct HomeView: View {
    
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
                        
                    }
                }
            }.navigationTitle("Mis Notas")
                .navigationBarItems(trailing: HStack {
                    Button(action: {
                        noteViewModel.showAddNote.toggle()
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
