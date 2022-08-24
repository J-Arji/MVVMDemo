//
//  NoteViewController.swift
//  MVVMDemo
//
//  Created by javad Arji on 8/24/22.
//

import UIKit
import Combine
class NoteViewController: UIViewController {
    //MARK: - Property
    private lazy var noteView: NoteView = {
        let view = NoteView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.gray.withAlphaComponent(0.3)
        return view
    }()
    
    var cancellables = Set<AnyCancellable>()
    var viewModel: NoteViewModel
    
    //MARK: - Life cycle
    
    init(viewModel: NoteViewModel = NoteViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setupUI()
        bindViewToViewModel()
        bindViewModelToView()
    }
    
    //MARK: - setup
    private func setupUI() {
        self.view.addSubview(noteView)
        NSLayoutConstraint.activate([
            noteView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.8),
            noteView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.5),
            noteView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0),
            noteView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 0)
        ])
        
        noteView.submitButton.addTarget(self, action: #selector(onClick), for: .touchUpInside)
    }
    
    //MARK: - bindData
    private func bindViewToViewModel() {
        noteView.textField.textPublisher
            .receive(on: DispatchQueue.main)
            .assign(to: \.noteText, on: viewModel)
            .store(in: &cancellables)
    }
    
    private func bindViewModelToView() {
        viewModel.isInputValid
            .receive(on: DispatchQueue.main)
            .assign(to: \.isValid, on: noteView)
            .store(in: &cancellables)
        
        viewModel.submitResult
            .sink(receiveCompletion: { _ in
                print("")
            }, receiveValue: { [weak self] _ in
                self?.navigateToList()
            })
            .store(in: &cancellables)

    }
    
    
    //MARK: - action
    @objc private func onClick() {
        viewModel.submitNote()
    }
    
    private func navigateToList() {
        let vc = MainViewController()
        self.present(vc, animated: true, completion: nil)
    }
}

