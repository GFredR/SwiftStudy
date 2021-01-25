//
//  ViewController.swift
//  ScrpllViewPractice
//
//  Created by 郭丰锐 on 2021/1/25.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var widthLayout: NSLayoutConstraint!
    
    @IBOutlet weak var scrollImg: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        widthLayout.constant = UIScreen.main.bounds.size.width
    }
    
    override func viewWillLayoutSubviews() {
//        scrollImg.frame.size.width = UIScreen.main.bounds.size.width
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
}

