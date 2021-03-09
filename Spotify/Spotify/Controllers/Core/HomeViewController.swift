//
//  ViewController.swift
//  Spotify
//
//  Created by 郭丰锐 on 2021/3/4.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Home"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gear"), style: .done, target: self, action: #selector(didTapSettings))
        // Do any additional setup after loading the view.
    }
    
    @objc func didTapSettings() -> Void {
        let settingsVC = SettingViewController()
        settingsVC.title = "Settings"
        settingsVC.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(settingsVC, animated: true)
    }

}

