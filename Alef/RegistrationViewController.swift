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

    private let addButton = AddButton()

    private var childStackViews: [TextFieldStackView] = []

    //    private lazy var scrollView: UIScrollView = {
    //        let scrollView = UIScrollView()
    //        scrollView.backgroundColor = .white
    //        scrollView.frame = view.bounds
    //        scrollView.contentSize = contentSize
    //        return scrollView
    //    }()

    //    private lazy var contentView: UIView = {
    //        let contentView = UIView()
    //        contentView.backgroundColor = #colorLiteral(red: 0.9882352941, green: 0.8, blue: 0.5490196078, alpha: 1)
    //        contentView.frame.size = contentSize
    //        return contentView
    //    }()

    //    private let personStackView: UIStackView = {
    //        let stackView = UIStackView()
    //    }()

    //    private var contentSize: CGSize {
    //        CGSize(width: view.frame.width, height: view.frame.height + 400)
    //    }

    override func viewDidLoad() {
        super.viewDidLoad()
        sutupView()
    }

    func addActionToAddButton() {
        addButton.addTarget(self, action: #selector(addChildStackView), for: .touchUpInside)
    }

    @objc func addChildStackView() {
        let newStackView = TextFieldStackView(type: 2)
        view.addSubview(newStackView)
        childStackViews.append(newStackView)
        setupChildTextFieldStackConstraints()
        if childStackViews.count == 5 {
            addButton.isHidden = true
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

        view.addSubview(addButton)
        addActionToAddButton()
        setupAddButtonConstraints()
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
        //        view.addSubview(scrollView)
        //        scrollView.addSubview(contentView)
        view.addSubview(personStackView)
        setupPersonTextFieldStackConstraints()
    }

    func setupSubViewTitle() {
        view.addSubview(titleLabel)
        settingsForTitle(title: titleLabel, text: "Регистрация", font: 36)
        setupTitleLableConstraints()
    }

    func setupSubViewSubTitle() {
        view.addSubview(subTitleLabel)
        settingsForTitle(title: subTitleLabel, text: "Информация о детях", font: 22)
        setupSubTitleLableConstraints()
    }
}

//MARK: Layout
private extension RegistrationViewController {
    func setupTitleLableConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
        ])
    }

    func setupPersonTextFieldStackConstraints() {
        personStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            personStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            personStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            //            personStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20)
            personStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant:330 )
        ])
    }

    func setupSubTitleLableConstraints() {
        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            subTitleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 25),
            subTitleLabel.topAnchor.constraint(equalTo: personStackView.bottomAnchor, constant: 25),
        ])
    }

    func setupAddButtonConstraints() {
        addButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            addButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40),
            addButton.topAnchor.constraint(equalTo: subTitleLabel.topAnchor, constant: 0)
        ])
    }

    func setupChildTextFieldStackConstraints() {
        for stackView in childStackViews {
            stackView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
                stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
                stackView.topAnchor.constraint(equalTo: subTitleLabel.bottomAnchor, constant: 25 )
            ])
        }

    }
}
