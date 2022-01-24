//
//  MesesCell.swift
//  MiAppIntroduccionTableView
//
//  Created by Luis Burgos on 24/1/22.
//

import UIKit

class MesesCell: UITableViewCell {
    
    //MARK: - IBOutlet
    @IBOutlet weak var miNombreMesLBL: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
