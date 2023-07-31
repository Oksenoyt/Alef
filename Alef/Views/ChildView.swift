//
//  ChaildView.swift
//  Alef
//
//  Created by Oksenoyt on 30.07.2023.
//

import UIKit

final class ChildView: UIView {

    private let nameTextField = RegisterTextField(placeholder: "Имя ребенка")
    private let ageTextField = RegisterTextField(placeholder: "лет")

    lazy var deleteButton: UIButton = {
        let button = UIButton()
        button.setTitle("удалить ребенка", for: .normal)
        button.setTitleColor( #colorLiteral(red: 0.368627451, green: 0.5764705882, blue: 0.6117647059, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        return button
     }()

    init() {
        super.init(frame: .zero)
        settings()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func settings() {
        addSubview(nameTextField)
        addSubview(ageTextField)
        addSubview(deleteButton)
    }

    private func setupConstraints() {
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        ageTextField.translatesAutoresizingMaskIntoConstraints = false
        deleteButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: topAnchor),
            nameTextField.leadingAnchor.constraint(equalTo: leadingAnchor),
            nameTextField.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.66),

            ageTextField.topAnchor.constraint(equalTo: topAnchor),
            ageTextField.trailingAnchor.constraint(equalTo: trailingAnchor),
            ageTextField.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.3),

            deleteButton.topAnchor.constraint(equalTo: ageTextField.bottomAnchor, constant: 3),
            deleteButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            deleteButton.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
