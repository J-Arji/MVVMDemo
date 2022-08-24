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
         $noteText
            .map { text in
                return text?.count ?? 0 > 3 
            }
            .eraseToAnyPublisher()
    }
    
    init() {
        
    }
    
    func submitNote() {
        submitResult.send(())
    }
    
}


