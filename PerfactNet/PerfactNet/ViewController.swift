//
//  ViewController.swift
//  PerfactNet
//
//  Created by 郭丰锐 on 2021/1/20.
//

import UIKit
import Alamofire
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
//    , UITableViewDelegate, UITableViewDataSource
    @IBOutlet weak var hahaTable: UITableView!
    var newsModel: NewsModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        hahaTable.delegate = self
        hahaTable.dataSource = self
//        hahaTable.register(HahaCell.self, forCellReuseIdentifier: "haha")
        loadDataByMoya()
        
//        print(newsModel?.result.data[0].author_name ?? "aggaga")
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsModel?.result.data.count ?? 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: HahaCell = tableView.dequeueReusableCell(withIdentifier: "haha", for: indexPath) as! HahaCell
        cell.model = newsModel?.result.data[indexPath.row]
//        print(newsModel?.result.data[indexPath.row])
        return cell
    }
    func loadDataByMoya() -> Void {
        HttpRequest.loadData(target: NewsApi.newsList(type: "shehui", key: "644dfb94bbda2b99f35a9756e76f2223"), model: NewsModel.self) { (model) in
            self.newsModel = model
            self.hahaTable.reloadData()
        } failure: { (errcode, message) in
            print(message)
        }

    }
    
//    func loadLinkData() -> Void {
//        NetworkKit().url(BaseUrl).requestType(.post).params(["type":"shehui","key":"644dfb94bbda2b99f35a9756e76f2223"]).success { (json) in
//            let decoder = JSONDecoder()
//            let model = try? decoder.decode(NewsModel.self, from: json)
//            self.newsModel = model
//            self.hahaTable.reloadData()
//        }.failure { (errcode, message) in
//            print("errcode\(String(describing: errcode)) message\(message)")
//        }.request()
//    }
//    func loadData() -> Void {
//       
//        NetworkTool.POST(url: BaseUrl, parameters: ["type":"shehui","key":"644dfb94bbda2b99f35a9756e76f2223"]) { (json) in
//                print(json)
//                let decoder = JSONDecoder()
//                let model = try? decoder.decode(NewsModel.self, from: json)
//                self.newsModel = model
//                self.hahaTable.reloadData()
//            } failure: { (status_code, message) in
//                print(message)
//            }
//        
//
//    }

}

