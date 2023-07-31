//
//  TextFieldStuckView.swift
//  Alef
//
//  Created by Oksenoyt on 30.07.2023.
//

import UIKit

final class PersonStackView: UIStackView {

    private let nameTextField = RegistrationTextField(placeholder: "Имя")
    private let middleNameTextField = RegistrationTextField(placeholder: "Фамилия")
    private let surnameTextField = RegistrationTextField(placeholder: "Отчество")
    private let ageTextField = RegistrationTextField(placeholder: "Полных лет")

    init() {
        super.init(frame: .zero)
        settings()
        addSubview()
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func settings() {
        axis = .vertical
        spacing = 16
        distribution = .fillEqually
    }

    private func addSubview() {
            addArrangedSubview(nameTextField)
            addArrangedSubview(middleNameTextField)
            addArrangedSubview(surnameTextField)
            addArrangedSubview(ageTextField)
    }
}
