//
//  TextFieldStuckView.swift
//  Alef
//
//  Created by Oksenoyt on 30.07.2023.
//

import UIKit

final class TextFieldStackView: UIStackView {

    private let nameTextField = RegisterTextField(placeholder: "Имя")
    private let middleNameTextField = RegisterTextField(placeholder: "Фамилия")
    private let surnameTextField = RegisterTextField(placeholder: "Отчество")
    private let ageTextField = RegisterTextField(placeholder: "Полных лет")

    init(type: Int) {
        super.init(frame: .zero)
        settings()
        addSubview(for: type)
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func settings() {
        axis = .vertical
        spacing = 16
        distribution = .fillEqually
    }

    func addSubview(for type: Int) {
        if type == 1 {
            addArrangedSubview(nameTextField)
            addArrangedSubview(middleNameTextField)
            addArrangedSubview(surnameTextField)
            addArrangedSubview(ageTextField)
        } else {
            addArrangedSubview(nameTextField)
            addArrangedSubview(ageTextField)
        }
    }
}
