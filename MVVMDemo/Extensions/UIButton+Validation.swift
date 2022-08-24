//
//  UIButton+Validation.swift
//  MVVMDemo
//
//  Created by javad Arji on 8/25/22.
//

import UIKit
import Combine

//this is extension for active and deactive buttun
extension UIButton {
    var isValid: Bool {
        get { isEnabled && backgroundColor == .red }
        set {
            backgroundColor = newValue ? .red : .green
            isEnabled = newValue
        }
    }
}
