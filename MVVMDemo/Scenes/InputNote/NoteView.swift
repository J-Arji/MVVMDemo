//
//  InputNoteView.swift
//  MVVMDemo
//
//  Created by javad Arji on 8/24/22.
//

import Foundation
import UIKit

class NoteView: UIView {
    //MARK: - Property
    lazy var textField: UITextField = {
        let textField = UITextField()
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.clipsToBounds = true
        textField.layer.cornerRadius = 8
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Enter somthing"
        return textField
    }()
    
    public lazy var submitButton: UIButton = {
        var button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Submit", for: .normal)
        button.setTitleColor(UIColor.gray, for: .disabled)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = .blue
        return button
    }()
    
    public var isValid: Bool = false {
        didSet {
            submitButton.backgroundColor = isValid ? UIColor.systemBlue : .systemCyan
            submitButton.isEnabled = isValid

        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        setupUI()
        theme()
    }
    
    
    
    private func theme() {
        self.layer.cornerRadius = 8
        self.clipsToBounds = true
        self.layer.borderColor = UIColor.gray.cgColor
        self.layer.borderWidth = 1
    }
    
    private func setupUI() {
        self.addSubview(textField)
        self.addSubview(submitButton)
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            textField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            textField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            textField.heightAnchor.constraint(equalToConstant: 50)
        ])
        NSLayoutConstraint.activate([
            submitButton.topAnchor.constraint(greaterThanOrEqualTo: textField.bottomAnchor, constant: 16),
            submitButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            submitButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            submitButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
            submitButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
}


