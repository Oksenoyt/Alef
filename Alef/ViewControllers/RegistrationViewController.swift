//
//  ViewController.swift
//  Alef
//
//  Created by Oksenoyt on 29.07.2023.
//

import UIKit

final class RegistrationViewController: UIViewController {
    private let titleLabel = UILabel()
    private let subTitleLabel = UILabel()
    private let personStackView = PersonStackView()
    private var childViews: [ChildView] = []

    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.frame = view.bounds
        scrollView.contentSize = contentSize

        // Если iOS 11 и выше, установите поведение для скролла с автоматической регулировкой контента
//           scrollView.contentInsetAdjustmentBehavior = .automatic

        return scrollView
    }()

    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = #colorLiteral(red: 0.9882352941, green: 0.8, blue: 0.5490196078, alpha: 1)
        contentView.frame.size = contentSize
        return contentView
    }()

    private lazy var childrenStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 16
        return stackView
    }()

    private lazy var addButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName:  "plus.circle.fill")
        let scale: CGFloat = 2
        button.setImage(image, for: .normal)
        button.tintColor = #colorLiteral(red: 0.368627451, green: 0.5764705882, blue: 0.6117647059, alpha: 1)
        button.transform = CGAffineTransform(scaleX: scale, y: scale)
        return button
    }()

    lazy var cleanButton: UIButton = {
        let button = UIButton()
        button.setTitle("Очистить форму", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.9882352941, green: 0.8, blue: 0.5490196078, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.backgroundColor = #colorLiteral(red: 0.368627451, green: 0.5764705882, blue: 0.6117647059, alpha: 1)
        button.layer.cornerRadius = 10
        return button
    }()

    private var contentSize: CGSize {
        CGSize(width: view.frame.width, height: view.frame.height + 220)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        sutupView()
        view.backgroundColor = #colorLiteral(red: 0.9882352941, green: 0.8, blue: 0.5490196078, alpha: 1)

    }

    private func addActionToAddButton() {
        addButton.addTarget(self, action: #selector(addChildView), for: .touchUpInside)
    }

    @objc private func addChildView() {
        let newChildView = ChildView()
        childrenStackView.addArrangedSubview(newChildView)
        childViews.append(newChildView)
        newChildView.deleteButton.addTarget(self, action: #selector(deleteChild(_:)), for: .touchUpInside)
        if childViews.count == 5 {
            addButton.isHidden = true
        }
    }

    @objc private func deleteChild(_ sender: UIButton) {
        if let childView = sender.superview as? ChildView {
            childrenStackView.removeArrangedSubview(childView)
            childView.removeFromSuperview()
            if let index = childViews.firstIndex(of: childView) {
                childViews.remove(at: index)
            }
            if childViews.count < 5 {
                addButton.isHidden = false
            }
        }
    }
}

//MARK: Setting
private extension RegistrationViewController {
    func sutupView() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)

        setupSubViewsPersonStackView()
        setupSubViewTitle()
        setupSubViewSubTitle()
        setupSubViewAddButton()

        contentView.addSubview(childrenStackView)
        setupChildTextFieldStackConstraints()
        setupSubViewCleanButton()
    }

    func settingsForTitle(title: UILabel,text: String, font: Int ) {
        title.text = text
        title.font = UIFont.boldSystemFont(ofSize: CGFloat(font))
        title.textAlignment = .center
        title.numberOfLines = 0
        title.textColor = #colorLiteral(red: 0.862745098, green: 0.4862745098, blue: 0.2823529412, alpha: 1)
    }
}

//MARK: addSubViews
private extension RegistrationViewController {
    func setupSubViewsPersonStackView() {
        contentView.addSubview(personStackView)
        setupPersonStackConstraints()
    }

    func setupSubViewTitle() {
        contentView.addSubview(titleLabel)
        settingsForTitle(title: titleLabel, text: "Регистрация", font: 36)
        setupTitleLableConstraints()
    }

    func setupSubViewSubTitle() {
        contentView.addSubview(subTitleLabel)
        settingsForTitle(title: subTitleLabel, text: "Информация о детях", font: 22)
        setupSubTitleLableConstraints()
    }

    func setupSubViewAddButton() {
        contentView.addSubview(addButton)
        addActionToAddButton()
        setupAddButtonConstraints()
    }

    func setupSubViewCleanButton() {
        contentView.addSubview(cleanButton)
        //        addActionToAddButton()
        setupCleanButtonConstraints()
    }

}

//MARK: Layout
private extension RegistrationViewController {
    func setupTitleLableConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16)
        ])
    }

    func setupPersonStackConstraints() {
        personStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            personStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            personStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            personStackView.bottomAnchor.constraint(equalTo: contentView.topAnchor, constant:330 )
        ])
    }

    func setupSubTitleLableConstraints() {
        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            subTitleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 21),
            subTitleLabel.topAnchor.constraint(equalTo: personStackView.bottomAnchor, constant: 25)
        ])
    }

    func setupAddButtonConstraints() {
        addButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            addButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            addButton.topAnchor.constraint(equalTo: subTitleLabel.topAnchor, constant: 0)
        ])
    }

    func setupChildTextFieldStackConstraints() {
        childrenStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            childrenStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            childrenStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            childrenStackView.topAnchor.constraint(equalTo: subTitleLabel.bottomAnchor, constant: 25 )
        ])
    }

    func setupCleanButtonConstraints() {
        cleanButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cleanButton.heightAnchor.constraint(equalToConstant: 50),
            cleanButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            cleanButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            cleanButton.topAnchor.constraint(equalTo: childrenStackView.bottomAnchor, constant: 35)
        ])
    }

}
