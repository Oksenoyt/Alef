//
//  ChaildView.swift
//  Alef
//
//  Created by Oksenoyt on 30.07.2023.
//

import UIKit

final class ChildStackView: UIStackView {

    private let nameTextField = RegistrationTextField(placeholder: "Имя ребенка")
    private let ageTextField = RegistrationTextField(placeholder: "лет")

    lazy var deleteButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName:  "plus.circle.fill")
        let scale: CGFloat = 2
        button.setImage(image, for: .normal)
        button.tintColor = #colorLiteral(red: 0.01568627451, green: 0.3803921569, blue: 0.462745098, alpha: 1)
        button.transform = CGAffineTransform(scaleX: scale, y: scale)
        return button
    }()

    init() {
        super.init(frame: .zero)
        settings()
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func settings() {
        axis = .horizontal
        addSubview()
        spacing = 16
        distribution = .fillProportionally
    }

    private func addSubview() {
        addArrangedSubview(nameTextField)
        addArrangedSubview(ageTextField)
        addArrangedSubview(deleteButton)
    }
}
