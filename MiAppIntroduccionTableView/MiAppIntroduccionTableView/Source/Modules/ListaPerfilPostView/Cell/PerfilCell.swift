//
//  PerfilCell.swift
//  MiAppIntroduccionTableView
//
//  Created by Luis Burgos on 26/1/22.
//

import UIKit


protocol PerfilCellOutputDelegate: AnyObject {
    func showAlertB1()
    func showAlertB2()
    func navigationToDetailView(withData: UserDataModel?)
}

protocol PerfilCellInputProtocol {
    func setupCellPerfil(data: UserDataModel?)
}

class PerfilCell: UITableViewCell, ReuseIdentifierView  {

    
    //MARK: - Variables globales
    weak var delegate: PerfilCellOutputDelegate?
    var modelData: UserDataModel?
    
    
    //MARK: - IBActions
    @IBAction func senderEvenAlertB1Action(_ sender: UIButton) {
        self.delegate?.showAlertB1()
    }
    
    @IBAction func senderEventAlertB2Action(_ sender: UIButton) {
        self.delegate?.showAlertB2()
    }
    
    @IBAction func senderEventAlertB3Action(_ sender: UIButton) {
        self.delegate?.navigationToDetailView(withData: self.modelData)
    }
    
    //MARK: - IBOutlets
    @IBOutlet weak var miImagenPerfil: UIImageView!
    @IBOutlet weak var miUsuarioLinkedinLBL: UILabel!
    @IBOutlet weak var miNombrePerfilLBL: UILabel!
    @IBOutlet weak var miDescripcionCvLBL: UILabel!
    @IBOutlet weak var miPuestoActualLBL: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension PerfilCell: PerfilCellInputProtocol {
    func setupCellPerfil(data: UserDataModel?) {
        self.modelData = data
        self.miImagenPerfil.image = UIImage(named: data?.imagePerfil ?? "thor")
        self.miUsuarioLinkedinLBL.text = data?.usuarioLinkedinPerfil
        self.miNombrePerfilLBL.text = data?.nombrePerfil
        self.miDescripcionCvLBL.text = data?.descripcionPerfil
        self.miPuestoActualLBL.text = data?.puestoActualPerfil
    }
}
