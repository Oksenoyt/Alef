//
//  RegisterTextField.swift
//  Alef
//
//  Created by Oksenoyt on 29.07.2023.
//
import UIKit

final class RegistrationTextField: UITextField {
    private let padding = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 40)

    init(placeholder: String) {
        super.init(frame: .zero)
        setupTextField(placeholder: placeholder)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }

    private func setupTextField(placeholder: String) {
        textColor = .white
        layer.cornerRadius = 10
        layer.backgroundColor = #colorLiteral(red: 0.01568627451, green: 0.3803921569, blue: 0.462745098, alpha: 1)

        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = 7
        layer.shadowOpacity = 0.4
        layer.shadowOffset = CGSize(width: 12, height: 12)

        attributedPlaceholder = NSAttributedString(
            string: placeholder,
            attributes: [NSAttributedString.Key.foregroundColor:UIColor.lightGray]
        )
        font = .boldSystemFont(ofSize: 16)

        heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}

