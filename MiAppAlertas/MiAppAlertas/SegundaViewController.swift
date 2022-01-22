//
//  SegundaViewController.swift
//  MiAppAlertas
//
//  Created by Luis Burgos on 22/1/22.
//

import UIKit

class SegundaViewController: UIViewController {
    
    //MARK: - Variables
    var dataSourceLocalidades = ["Salamanca", "La Fatina", "Valladolid", "Gentas"]
    let dataSourceCodigosPostales = ["21001", "22002", "47005", "23003"]
    let dataSourcePrioridadTeletrabajo = ["Altisima", "Media", "Baja"]
    let dataSourceFotosPerfil = ["hombre", "mujer"]
    
    //MARK: - IBOutlets
    @IBOutlet weak var localidadesTF: UITextField!
    @IBOutlet weak var codigoPostalTF: UITextField!
    @IBOutlet weak var prioridadTrabajoTF: UITextField!
    @IBOutlet weak var perfilImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.configuracionUI()
    }
    
    //MARK: - Funciones privadas
    private func configuracionUI() {
        
    }

}
