//
//  SigninController.swift
//  ComprehensivePractice
//
//  Created by 郭丰锐 on 2021/2/2.
//

import UIKit

class SigninController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    

    @IBAction func signinAction(_ sender: Any) {
        let tabStoryBoard = UIStoryboard(name: "BaseTabBar", bundle: nil)
        let tabBarVC = tabStoryBoard.instantiateViewController(withIdentifier: "BaseTabBarController")
        tabBarVC.modalPresentationStyle = .fullScreen
        self.present(tabBarVC, animated: true) {
        }
    }
    
   

}
