//
//  GoldController.swift
//  ComprehensivePractice
//
//  Created by 郭丰锐 on 2021/2/20.
//

import UIKit

class GoldController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        loadGoldData()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
    

    @IBAction func backAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    

}
extension GoldController {
    func loadGoldData() -> Void {
        HttpRequest.loadData(target: GoldAPI.goldenMessage(key: "efca0ba22b68ee905ea3cd9741b79042", v: "1"), model: GoldModel.self) { (model) in
            print(model ?? "nil")
        } failure: { (errorcode, message) in
            print(message)
        }

    }
}
