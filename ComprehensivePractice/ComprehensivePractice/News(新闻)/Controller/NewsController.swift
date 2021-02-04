//
//  NewsController.swift
//  ComprehensivePractice
//
//  Created by 郭丰锐 on 2021/2/2.
//

import UIKit

class NewsController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var newsTableView: UITableView!
    var newsModel: NewsModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        newsTableView.delegate = self
        newsTableView.dataSource = self
        loadNewsData()
        newsTableView.rowHeight = 90
        // Do any additional setup after loading the view.
    }
    
    
    

}
// MARK: -TableView部分
extension NewsController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsModel?.result.data.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: NewsCell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as! NewsCell
        cell.model = newsModel?.result.data[indexPath.row]
        return cell
        
    }
    
}
//MARK: -请求数据部分
extension NewsController {
    func loadNewsData() -> Void {
        HttpRequest.loadData(target: NewsApi.newsList(type: "shehui", key: "644dfb94bbda2b99f35a9756e76f2223"), model: NewsModel.self) { (model) in
            self.newsModel = model
            self.newsTableView.reloadData()
        } failure: { (errcode, message) in
            print(message)
        }
}
}
