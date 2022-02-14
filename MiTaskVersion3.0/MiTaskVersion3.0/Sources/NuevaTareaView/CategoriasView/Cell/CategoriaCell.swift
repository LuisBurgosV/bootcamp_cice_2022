//
//  CategoriaCell.swift
//  MiTaskVersion3.0
//
//  Created by Luis Burgos on 14/2/22.
//

import UIKit

class CategoriaCell: UITableViewCell, ReuseIdentifierProtocol {

    //MARK: - IBOutlets
    @IBOutlet weak var nombreCategoriaLBL: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
