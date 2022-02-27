//
//  MenuCell.swift
//  CiceMusic
//
//  Created by Luis Burgos on 27/2/22.
//

import UIKit

protocol MenuCellProtocol {
    func setupCell(data: MenuResponse)
}

class MenuCell: UITableViewCell, ReuseIdentifierProtocol {
    
    //MARK: - IBOutlets
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var nameMenuLBL: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension MenuCell: MenuCellProtocol {
    func setupCell(data: MenuResponse) {
        self.nameMenuLBL.text = data.menu?.literal
    }
}
