//
//  File.swift
//  MVVMDemo
//
//  Created by javad Arji on 8/18/22.
//

import Foundation

class MainViewModel {
    
    // MARK: - Initialization
    init(model: [BreachModel]? = nil) {
        if let inputModel = model {
            breaches = inputModel
        }
    }
    
    var breaches: [BreachModel] = [BreachModel(title: "000webhost"), BreachModel(title: "126")]
    
}

extension MainViewModel {
    func fetchBreaches(completion: @escaping (Result<[BreachModel], Error>) -> Void) {
        completion(.success(breaches))
    }
}


extension MainViewModel {
    public func numberOfRowsInSection() -> Int {
        breaches.count
    }
    
    public func cellForRowAt(indexPath: IndexPath) -> BreachModel {
        breaches[indexPath.row]
    }
    
}
