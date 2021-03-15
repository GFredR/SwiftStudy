//
//  LoginController.swift
//  NetEaseCloudMusic
//
//  Created by 郭丰锐 on 2021/3/1.
//

import UIKit
import SwiftyJSON
import HandyJSON
class LoginController: UIViewController {
    var userModel: UserInfoModel?

    @IBOutlet weak var phoneNumField: UITextField!
    
    @IBOutlet weak var pwdField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func loginAction(_ sender: Any) {
       login()

    }
    func login() -> Void {
//        HttpRequest.loadData(target: LoginAPI.loginAction(phone: phoneNumField.text!, password: pwdField.text!), model: UserInfoModel.self) { model in
//            self.userModel = model
//            print("-----------\(self.userModel)" ?? "a")
//        } failure: { (code, message) in
//            print(message)
//        }
        NetWorkRequest(.login(parameters: ["phone": phoneNumField.text ?? "", "password": pwdField.text ?? ""])) { (data) in
            let json = JSON(data)
            
            if let userInfo = JSONDeserializer<UserInfoModel>.deserializeFrom(json: json.description){
                self.userModel = userInfo
                print("------\(String(describing: self.userModel?.profile?.nickname))")
            }
            
        } failed: { (error) in
            print(error)
        }

    }
}
