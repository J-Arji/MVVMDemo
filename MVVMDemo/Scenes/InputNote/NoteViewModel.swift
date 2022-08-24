//
//  NoteViewModel.swift
//  MVVMDemo
//
//  Created by javad Arji on 8/24/22.
//

import Foundation
import Combine

import UIKit
class NoteViewModel{
    @Published var noteText: String?
    var submitResult = PassthroughSubject<Void, Error>()
    var passText = CurrentValueSubject<String, Never>("")
    var isInputValid: AnyPublisher<Bool, Never> {
        return $noteText
            .debounce(for: 0.3, scheduler: RunLoop.main)
            .flatMap { note in
                return Future { promise in
                    promise(.success(note?.count ?? 0 > 3 ? true : false))
                }
            }
            .eraseToAnyPublisher()
    }
    
    init() {
        
    }
    
    func submitNote() {
        submitResult.send(())
    }
    
}


