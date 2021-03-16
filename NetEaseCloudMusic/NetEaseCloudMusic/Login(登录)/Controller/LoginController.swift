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
        NetWorkRequest(.login(parameters: ["phone": phoneNumField.text ?? "", "password": pwdField.text ?? ""])) { (data) in
            let json = JSON(data)
            GFRAlert.show(type: .info, text: "正在登录", view: self.view)
            if let userInfo = JSONDeserializer<UserInfoModel>.deserializeFrom(json: json.description){
                self.userModel = userInfo
                if self.userModel?.code == 200 {
                    UserDefaults.standard.setValue(self.userModel?.account?.id, forKey: "id")
                    UserDefaults.standard.setValue(self.userModel?.profile?.nickname, forKey: "user_name")
                    UserDefaults.standard.setValue(self.userModel?.profile?.userId, forKey: "user_id")
                    UserDefaults.standard.setValue(self.userModel?.profile?.avatarUrl, forKey: "avatar_url")
                    UserDefaults.standard.setValue(self.userModel?.token, forKey: "token")
                    UserDefaults.standard.setValue(self.userModel?.account?.vipType, forKey: "token")
                    UserDefaults.standard.setValue(self.userModel?.account?.viptypeVersion, forKey: "token")
                    
                    
                    GFRAlert.show(type: .success, text: "登录成功", view: self.view)
                    let tabStoryBoard = UIStoryboard.init(name: "BaseTabBar", bundle: nil)
                    let tabVC = tabStoryBoard.instantiateInitialViewController()!
                    tabVC.modalPresentationStyle = .fullScreen
                    self.present(tabVC, animated: true) {
                        
                    }
                   
                } else {
                    GFRAlert.show(type: .error, text: "登录失败", view: self.view)
                    return
                }
            }
            
        } failed: { (error) in
            print(error)
        }

    }
}
