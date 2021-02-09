//
//  JokeCell.swift
//  ComprehensivePractice
//
//  Created by 郭丰锐 on 2021/2/9.
//

import UIKit

class JokeCell: UITableViewCell {

    @IBOutlet weak var jokeTextView: UITextView!
    var jokeModel: EntertainmentModel.EntertainmentData.EntertainmentList? {
        didSet {
            bindJokeData()
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

extension JokeCell {
    func bindJokeData() -> Void {
        guard let model = jokeModel else {
            return
        }
        jokeTextView.text = model.content
    }
}
