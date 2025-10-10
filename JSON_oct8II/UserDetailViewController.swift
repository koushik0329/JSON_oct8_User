//
//  UserDetailViewController.swift
//  JSON_oct8II
//
//  Created by Koushik Reddy Kambham on 10/9/25.
//


import UIKit

class UserDetailViewController: UIViewController {

    private let user: User
    private let contentStack = UIStackView()

    init(user: User) {
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = user.name
        view.backgroundColor = .systemBackground
        setupUI()
    }

    private func setupUI() {
        contentStack.axis = .vertical
        contentStack.spacing = 10
        contentStack.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(contentStack)

        NSLayoutConstraint.activate([
            contentStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            contentStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            contentStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            contentStack.bottomAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16)
        ])

        let infoList = [
            "ID: \(user.id)",
            "Name: \(user.name)",
            "Username: \(user.username)",
            "Email: \(user.email)",
            "Phone: \(user.phone)",
            "Website: \(user.website)",
            "Company: \(user.company.name)",
            "Catchphrase: \(user.company.catchPhrase)",
            "Address: \(user.address.suite), \(user.address.street), \(user.address.city) - \(user.address.zipcode)",
            "Geo: (\(user.address.geo.lat), \(user.address.geo.lng))"
        ]

        for text in infoList {
            let label = UILabel()
            label.text = text
            label.numberOfLines = 0
            contentStack.addArrangedSubview(label)
        }
    }
}
