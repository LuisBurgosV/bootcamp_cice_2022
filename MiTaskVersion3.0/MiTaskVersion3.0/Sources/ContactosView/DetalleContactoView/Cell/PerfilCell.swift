//
//  PerfilCell.swift
//  MiTaskVersion3.0
//
//  Created by Luis Burgos on 1/2/22.
//

import UIKit

protocol PerfilCellProtocol {
    func configuracionCell(data: ArrayContact)
}

class PerfilCell: UITableViewCell, ReuseIdentifierProtocol {

    //MARK: - IBOutlets
    @IBOutlet weak var photoProfile: UIImageView!
    @IBOutlet weak var usuarioTwitter: UILabel!
    @IBOutlet weak var nombrePerfil: UILabel!
    @IBOutlet weak var apellidoPerfil: UILabel!
    @IBOutlet weak var CvPerfil: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension PerfilCell: PerfilCellProtocol {
    func configuracionCell(data: ArrayContact) {
        self.photoProfile.image = UIImage(named: data.imageProfile ?? "placeholder")
        self.usuarioTwitter.text = data.usernameTwitter
        self.nombrePerfil.text = data.firstName
        self.apellidoPerfil.text = data.lastName
        self.CvPerfil.text = data.descriptionCV
    }
}
