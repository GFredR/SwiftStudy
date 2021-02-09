//
//  EntertainmentController.swift
//  ComprehensivePractice
//
//  Created by 郭丰锐 on 2021/2/2.
//

import UIKit
import MJRefresh
class EntertainmentController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var jokeTable: UITableView!
    var paraPage = 2
//    lazy var jokeArr = [Any]()
    var jokeModel: EntertainmentModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        jokeTable.delegate = self
        jokeTable.dataSource = self
        jokeTable.rowHeight = 159
        loadJokeData()
        setPullup()
        setPulldown()
        // Do any additional setup after loading the view.
    }
    
}
extension EntertainmentController {
    func setPulldown() -> Void {
        jokeTable.mj_header = MJRefreshNormalHeader.init(refreshingTarget: self, refreshingAction: #selector(reloadJoke))
    }
    @objc func reloadJoke() -> Void {
        HttpRequest.loadData(target: JokeAPI.jokeList(page: 1, pageSize: 15, key: "89a6bb7e80e9440fa99196ab57b3095a"), model: EntertainmentModel.self) { (model) in
            self.jokeModel = model
            self.jokeTable.mj_header?.endRefreshing()
            self.jokeTable.reloadData()
        } failure: { (errcode, message) in
            print("\(String(describing: errcode))--------\(message)")
        }
    }
    func setPullup() -> Void {
        jokeTable.mj_footer = MJRefreshAutoNormalFooter.init(refreshingTarget: self, refreshingAction: #selector(loadMore))
    }
    @objc func loadMore() -> Void {
        HttpRequest.loadData(target: JokeAPI.jokeList(page: paraPage, pageSize: 15, key: "89a6bb7e80e9440fa99196ab57b3095a"), model: EntertainmentModel.self) { (model) in
            self.jokeModel?.result.data.append(contentsOf: (model?.result.data)!)
            self.jokeTable.reloadData()
            self.jokeTable.mj_footer?.endRefreshing()
            self.paraPage += 1
        } failure: { (errcode, message) in
            print("\(String(describing: errcode))--------\(message)")
        }
    }
}
extension EntertainmentController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jokeModel?.result.data.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: JokeCell = tableView.dequeueReusableCell(withIdentifier: "JokeCell", for: indexPath) as! JokeCell
        cell.jokeModel = jokeModel?.result.data[indexPath.row]
        return cell
    }
}

extension EntertainmentController {
    func loadJokeData() -> Void {
        HttpRequest.loadData(target: JokeAPI.jokeList(page: 1, pageSize: 15, key: "89a6bb7e80e9440fa99196ab57b3095a"), model: EntertainmentModel.self) { (model) in
            self.jokeModel = model
            self.jokeTable.reloadData()
        } failure: { (errcode, message) in
            print("\(String(describing: errcode))--------\(message)")
        }

    }
}
