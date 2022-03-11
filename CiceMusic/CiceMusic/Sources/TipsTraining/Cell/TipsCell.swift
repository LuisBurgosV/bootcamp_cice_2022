//
//  TipsCell.swift
//  CiceMusic
//
//  Created by Luis Burgos on 8/3/22.
//

import UIKit
protocol TipsCellProtocol {
    func setupCell(data: ConsejosGenerale)
}

class TipsCell: UITableViewCell, ReuseIdentifierProtocol {
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var tipImage: UIImageView!
    @IBOutlet weak var titleTipsLBL: UILabel!
    @IBOutlet weak var messageTipsLBL: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension TipsCell: TipsCellProtocol {
    func setupCell(data: ConsejosGenerale) {
        self.titleTipsLBL.text = data.title
        self.messageTipsLBL.text = data.subtitle
    }
}