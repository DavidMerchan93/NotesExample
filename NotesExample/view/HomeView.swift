//
//  HomeView.swift
//  NotesExample
//
//  Created by David Merchan on 21/12/24.
//

import SwiftUI
import Combine

struct HomeView: View {
    
    @Environment(\.managedObjectContext) var context
    @StateObject var noteViewModel = NotesViewModel()
    
    var body: some View {
        Button("Open") {
            noteViewModel.showAddNote.toggle()
        }.sheet(isPresented: $noteViewModel.showAddNote) {
            AddNoteView(noteModel: noteViewModel)
        }
    }
}

#Preview {
    HomeView()
}
