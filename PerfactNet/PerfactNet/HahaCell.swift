//
//  HahaCell.swift
//  PerfactNet
//
//  Created by 郭丰锐 on 2021/1/21.
//

import UIKit

class HahaCell: UITableViewCell {
    
    var model: NewsModel.NewsResult.NewsList? {
        didSet {
            setUI()
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
extension HahaCell {
    func setUI() -> Void {
        guard let model = model else {
            return
        }
        self.textLabel?.text = model.author_name
    }
}
