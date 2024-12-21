//
//  NotesViewModel.swift
//  NotesExample
//
//  Created by David Merchan on 21/12/24.
//

import Foundation
import Combine
import CoreData
import SwiftUI

class NotesViewModel: ObservableObject {
    @Published var note: String = ""
    @Published var date: Date = Date()
    @Published var showAddNote: Bool = false
    
    // CoreData
    func saveNote(context: NSManagedObjectContext) {
        let newNote = NoteEntity(context: context)
        
        newNote.detail = note
        newNote.date = date
        
        do {
            try context.save()
        } catch let error as NSError {
            print("Ocurrio un error al guardar la nota: \(error.localizedDescription)")
        }
    }
}
