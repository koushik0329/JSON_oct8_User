//
//  UserTableViewCell.swift
//  JSON_oct8II
//
//  Created by Koushik Reddy Kambham on 10/9/25.
//

import UIKit

class UserTableViewCell : UITableViewCell {
    var idLabel = UILabel()
    var nameLabel = UILabel()
    var emailLabel = UILabel()
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        idLabel.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        idLabel.textColor = .label
        idLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(idLabel)
        
        nameLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        nameLabel.textColor = .label
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(nameLabel)
        
        emailLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        emailLabel.textColor = .secondaryLabel
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(emailLabel)
        
        NSLayoutConstraint.activate([
            idLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            idLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            
            nameLabel.topAnchor.constraint(equalTo: idLabel.bottomAnchor, constant: 6),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            
            emailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 6),
            emailLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            emailLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
    
    func configure(with user: User) {
        idLabel.text = "\(user.id)"
        nameLabel.text = user.name
        emailLabel.text = user.email
    }
}
