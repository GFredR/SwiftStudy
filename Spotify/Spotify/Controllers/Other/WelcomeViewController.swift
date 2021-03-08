//
//  WelcomeViewController.swift
//  Spotify
//
//  Created by 郭丰锐 on 2021/3/4.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    private let signButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Sign In With Spotify", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Spotify"
        view.backgroundColor = .systemGreen
        view.addSubview(signButton)
        signButton.addTarget(self, action: #selector(didTapSignIn), for: .touchUpInside)
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        signButton.frame = CGRect(x: 20,
                                  y: view.height - 50 - view.safeAreaInsets.bottom,
                                  width: view.width - 40,
                                  height: 50)
    }
    
    @objc func didTapSignIn() -> Void {
        let authVC = AuthViewController()
        authVC.completionHandler = { [weak self] success in
            DispatchQueue.main.async {
                self?.handleSignIn(success: success)
            }
        }
        authVC.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(authVC, animated: true)
    }
    
    private func handleSignIn(success: Bool) {
        guard success else {
            let alert = UIAlertController(title: "Oops", message: "Something went wrong when signing in.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
            present(alert, animated: true, completion: nil)
            return
        }
        
        let mainAppTabBarVC = TabBarViewController()
        mainAppTabBarVC.modalPresentationStyle = .fullScreen
        present(mainAppTabBarVC, animated: true) {
            
        }
    }
    
}
