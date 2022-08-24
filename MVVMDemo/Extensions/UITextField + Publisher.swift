//
//  UITextField + Publisher.swift
//  MVVMDemo
//
//  Created by javad Arji on 8/25/22.
//

import UIKit
import Combine

extension UITextField {

    var textPublisher: AnyPublisher<String?, Never> {
        NotificationCenter.default.publisher(
            for: UITextField.textDidChangeNotification,
            object: self
        )
        .map { ($0.object as? UITextField)?.text }
        .eraseToAnyPublisher()
    }

}
