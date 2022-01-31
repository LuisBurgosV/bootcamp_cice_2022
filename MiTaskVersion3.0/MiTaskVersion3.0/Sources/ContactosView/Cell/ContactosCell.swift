//
//  ContactosCell.swift
//  MiTaskVersion3.0
//
//  Created by Luis Burgos on 31/1/22.
//

import UIKit

protocol ContactosCellProtocol {
    func configuracionCell(data: ArrayContact)
}

class ContactosCell: UITableViewCell, ReuseIdentifierProtocol {

    //MARK: - IBOutlets
    
    @IBOutlet weak var imagePerfil: UIImageView!
    @IBOutlet weak var namePerfil: UILabel!
    @IBOutlet weak var lastnamePerfil: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.configuracionUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK: - metodos privados
    private func configuracionUI() {
        self.imagePerfil.layer.cornerRadius = self.imagePerfil.frame.width / 2
        self.imagePerfil.layer.borderWidth = 1
        self.imagePerfil.layer.borderColor = UIColor.gray.cgColor
    }
    
}

extension ContactosCell: ContactosCellProtocol {
    func configuracionCell(data: ArrayContact) {
        self.imagePerfil.image = UIImage(named: data.imageProfile ?? "placeholder")
        self.namePerfil.text = data.firstName
        self.lastnamePerfil.text = data.lastName
    }
}
