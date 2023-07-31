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
    private let personStackView = TextFieldStackView(type: 1)

    private let addButton = AddButton(image: "plus.circle.fill")

    private var childStackViews: [ChildView] = []

    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.frame = view.bounds
        scrollView.contentSize = contentSize
        return scrollView
    }()

    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = #colorLiteral(red: 0.9882352941, green: 0.8, blue: 0.5490196078, alpha: 1)
        contentView.frame.size = contentSize
        return contentView
    }()

    //    private let personStackView: UIStackView = {
    //        let stackView = UIStackView()
    //    }()

    private lazy var childrenStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 16
        return stackView
    }()

    private var contentSize: CGSize {
        CGSize(width: view.frame.width, height: view.frame.height + 230)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        sutupView()
    }

    func addActionToAddButton() {
        addButton.addTarget(self, action: #selector(addChildStackView), for: .touchUpInside)
    }

    @objc func addChildStackView() {
        let newChildStackView = ChildView()
        childrenStackView.addArrangedSubview(newChildStackView)
        childStackViews.append(newChildStackView)
        newChildStackView.deleteButton.addTarget(self, action: #selector(deleteChild(_:)), for: .touchUpInside)
        if childStackViews.count == 5 {
            addButton.isHidden = true
        }
    }

    @objc private func deleteChild(_ sender: UIButton) {
        if let childInfoView = sender.superview as? ChildView {
            childrenStackView.removeArrangedSubview(childInfoView)
            childInfoView.removeFromSuperview()
            if let index = childStackViews.firstIndex(of: childInfoView) {
                childStackViews.remove(at: index)
            }

            if childStackViews.count < 5 {
                addButton.isHidden = false
            }
        }
    }
}

//MARK: Setting
private extension RegistrationViewController {
    func sutupView() {
        view.backgroundColor = #colorLiteral(red: 0.9882352941, green: 0.8, blue: 0.5490196078, alpha: 1)

        addSubViewsForPersonStackView()
        setupSubViewTitle()
        setupSubViewSubTitle()

        contentView.addSubview(addButton)
        addActionToAddButton()
        setupAddButtonConstraints()
        contentView.addSubview(childrenStackView)
        setupChildTextFieldStackConstraints()
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
    func addSubViewsForPersonStackView() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(personStackView)
        setupPersonTextFieldStackConstraints()
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
}

//MARK: Layout
private extension RegistrationViewController {
    func setupTitleLableConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
        ])
    }

    func setupPersonTextFieldStackConstraints() {
        personStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            personStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            personStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            //            personStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20)
            personStackView.bottomAnchor.constraint(equalTo: contentView.topAnchor, constant:330 )
        ])
    }

    func setupSubTitleLableConstraints() {
        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            subTitleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 21),
            subTitleLabel.topAnchor.constraint(equalTo: personStackView.bottomAnchor, constant: 25),
        ])
    }

    func setupAddButtonConstraints() {
        addButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            addButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
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

    }
