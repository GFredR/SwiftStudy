//
//  ProfileViewController.swift
//  Spotify
//
//  Created by 郭丰锐 on 2021/3/4.
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.isHidden = true
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    private var models = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        fetchProfile()
        view.backgroundColor = .systemBackground
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    private func fetchProfile() -> Void {
        APICaller.shared.getCurrentUserProfile { [weak self] result in
            switch result {
            case .success(let model):
                DispatchQueue.main.async {
                    self?.updateUI(with: model)
                }
                
            case .failure(let error):
                print(error.localizedDescription)
                self?.failedToGetProfile()
            }
        }
    }
    
    private func updateUI(with model: UserProfile) {
        tableView.isHidden = false
        models.append("Full Name : \(model.display_name)")
        models.append("Email Address : \(model.email)")
        models.append("User ID : \(model.id)")
        models.append("Plan : \(model.product)")
        tableView.reloadData()
    }
    
    private func failedToGetProfile() -> Void {
        let label = UILabel(frame: .zero)
        label.text = "Failed to get Profile"
        label.sizeToFit()
        label.backgroundColor = .secondaryLabel
        view.addSubview(label)
        label.center = view.center
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = models[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
}
