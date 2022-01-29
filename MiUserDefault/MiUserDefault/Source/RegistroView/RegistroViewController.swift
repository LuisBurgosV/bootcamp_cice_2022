//
//  RegistroViewController.swift
//  MiUserDefault
//
//  Created by Luis Burgos on 29/1/22.
//

import UIKit

class RegistroViewController: UIViewController {

    
    //MARK: - Variables Globales
    var existeFoto = false
    var usuarioLogado = false
    
    //MARK: - IBOutlets
    @IBOutlet weak var nombreTF: UITextField!
    @IBOutlet weak var apellidosTF: UITextField!
    @IBOutlet weak var direccionTF: UITextField!
    @IBOutlet weak var telefonoTF: UITextField!
    @IBOutlet weak var imagenPerfil: UIImageView!
    @IBOutlet weak var fechaActualizacionLBL: UILabel!
    
    //MARK: - IBActions
    @IBAction func guardarDatosAction(_ sender: Any) {
    }
    
    @IBAction func recuperarDatosAction(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
