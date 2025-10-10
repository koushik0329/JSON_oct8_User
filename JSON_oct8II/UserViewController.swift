//
//  UserViewController.swift
//  JSON_oct8II
//
//  Created by Koushik Reddy Kambham on 10/9/25.
//

import UIKit

class UserViewController : UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableView = UITableView()
    
    let viewModelObj : UserViewModel?
    
    init(viewModelObj : UserViewModel) {
        self.viewModelObj = viewModelObj
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Users"
        view.backgroundColor = .systemBackground
        setupTableView()
        Task { await fetchData() }
    }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UserTableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func fetchData() async{
        await viewModelObj?.getData()
        self.tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModelObj?.getUsersCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? UserTableViewCell else {
            return UITableViewCell()
        }
        if let user = viewModelObj?.getUsers(at: indexPath.row) {
            cell.configure(with: user)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let user = viewModelObj?.getUsers(at: indexPath.row) else { return }
        let detailVC = UserDetailViewController(user: user)
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
