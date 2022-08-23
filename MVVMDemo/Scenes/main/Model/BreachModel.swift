//
//  BreachModel.swift
//  MVVMDemo
//
//  Created by javad Arji on 8/18/22.
//

import Foundation

public struct BreachModel {
    
    var title: String
    var givenName: String?
    var lastName: String?
    
    var fullname: String? {
        var fullname: String?
        if let given = givenName { fullname = given + " " }
        if let last = lastName {
            if fullname == nil {
                fullname = last
            } else {
                fullname! += last
            }
        }
        return fullname?.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}

