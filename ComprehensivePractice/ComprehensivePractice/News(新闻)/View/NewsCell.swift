//
//  NewsCell.swift
//  ComprehensivePractice
//
//  Created by 郭丰锐 on 2021/2/3.
//

import UIKit

class NewsCell: UITableViewCell {

    @IBOutlet weak var newsTitleLabel: UILabel!
    @IBOutlet weak var newsTime: UILabel!
    @IBOutlet weak var newsImgView: UIImageView!
    var model: NewsModel.NewsResult.NewsData? {
        didSet {
            setupUI()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
extension NewsCell {
    func setupUI() -> Void {
        guard let model = model else {
            return
        }
        self.newsTitleLabel.text = model.title
        self.newsTime.text = model.date
        self.newsImgView.setNetImage(url: model.thumbnail_pic_s)
    }
}
