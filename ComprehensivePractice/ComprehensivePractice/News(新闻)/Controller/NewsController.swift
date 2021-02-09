//
//  NewsController.swift
//  ComprehensivePractice
//
//  Created by 郭丰锐 on 2021/2/2.
//

import UIKit
import MJRefresh
import MBProgressHUD
class NewsController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var newsTableView: UITableView!
    var newsModel: NewsModel?
    
    lazy var refreshTool: UIRefreshControl = {
        let refresh: UIRefreshControl = UIRefreshControl(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: ScreenHeght))
        
        return refresh
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newsTableView.delegate = self
        newsTableView.dataSource = self
        newsTableView.separatorStyle = .none
        setupTableUI()
        loadNewsData()
        setRefreshSetting()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        MBProgressHUD.showAdded(to: self.view, animated: true)
    }
    

}
// MARK: -UIRefreshControl设置
extension NewsController {
    func setRefreshSetting() -> Void {
        newsTableView.mj_header = MJRefreshNormalHeader.init(refreshingTarget: self, refreshingAction: #selector(reloadNewsData))

    }
    @objc func reloadNewsData() -> Void {
        HttpRequest.loadData(target: NewsApi.newsList(type: "shehui", key: "644dfb94bbda2b99f35a9756e76f2223"), model: NewsModel.self) { (model) in
            self.newsModel = model
            self.newsTableView.mj_header?.endRefreshing()
            self.newsTableView.reloadData()
            
        } failure: { (errcode, message) in
            print(message)
        }
    }
    
}
// MARK: -TableView样式部分
extension NewsController {
    func setupTableUI() -> Void {
        newsTableView.rowHeight = 90
    }
}
// MARK: -TableView数据源部分
extension NewsController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsModel?.result.data.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: NewsCell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as! NewsCell
        cell.model = newsModel?.result.data[indexPath.row]
        cell.selectionStyle = .none
        return cell
        
    }
    
}
//MARK: -请求数据部分
extension NewsController {
    func loadNewsData() -> Void {
        HttpRequest.loadData(target: NewsApi.newsList(type: "shehui", key: "644dfb94bbda2b99f35a9756e76f2223"), model: NewsModel.self) { (model) in
            self.newsModel = model
            self.newsTableView.reloadData()
            MBProgressHUD.hide(for: self.view, animated: true)
            self.newsTableView.separatorStyle = .singleLine
        } failure: { (errcode, message) in
            print(message)
        }
}
}
