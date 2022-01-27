//
//  PostCell.swift
//  MiAppIntroduccionTableView
//
//  Created by Luis Burgos on 26/1/22.
//

import UIKit

protocol PostCellProtocol {
    func setupPostCell(data: UserDataModel?)
}

class PostCell: UITableViewCell, ReuseIdentifierView {

    //MARK: - IBOutlets
    
    @IBOutlet weak var miImagenPerfilPost: UIImageView!
    

    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.configuracionUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func configuracionUI() {
        self.miImagenPerfilPost.layer.cornerRadius = self.miImagenPerfilPost.frame.width / 2
    }
    
}

extension PostCell: PostCellProtocol {
    func setupPostCell(data: UserDataModel?) {
        self.miImagenPerfilPost.image = UIImage(named: data?.imagePerfil ?? "thor")
    }
}
