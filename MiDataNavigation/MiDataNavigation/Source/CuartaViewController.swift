//
//  CuartaViewController.swift
//  MiDataNavigation
//
//  Created by Luis Burgos on 22/1/22.
//

import UIKit
import MessageUI

class CuartaViewController: UIViewController {

    //MARK: - Variables
    var datosUsuario = DatosUsuarioModel()
    
    //MARK: - IBOutlets
    @IBOutlet weak var miNombreLBL: UILabel!
    @IBOutlet weak var miApellidoLBL: UILabel!
    @IBOutlet weak var miTelefonoLBL: UILabel!
    @IBOutlet weak var miDireccionLBL: UILabel!
    @IBOutlet weak var edadPerroLBL: UILabel!
    @IBOutlet weak var codigoPostalLBL: UILabel!
    @IBOutlet weak var miCiudadLBL: UILabel!
    @IBOutlet weak var posicionGeograficaLBL: UILabel!
    
    @IBAction func logoutButtonACTION(_ sender: Any) {
        
        
    }
    
    @IBAction func enviarMailACTION(_ sender: UIButton) {
        
        if MFMailComposeViewController.canSendMail() {
            self.present(self.configuracionMailCompose(), animated: true, completion: nil)
        }else{
            self.present(Utils.shared.showAlertVC(title: "Que pasa!!", message: "Estas en un simulador, no puedes enviar datos"), animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configuracionUI()
    }
    
    //MARK: - funciones privadas
    private func configuracionUI() {
        self.miNombreLBL.text = "Mi nombre es " + (self.datosUsuario.nombreData ?? "")
        self.miApellidoLBL.text = "Mi apellido es " + (self.datosUsuario.apellidoData ?? "")
        self.miTelefonoLBL.text = "Mi telefono es " + (self.datosUsuario.telefonoData ?? "")
        self.miDireccionLBL.text = "Mi direccion es " + (self.datosUsuario.direccionData ?? "")
        self.edadPerroLBL.text = "La edad de mi perro es " + (self.datosUsuario.edadPerroData ?? "")
        self.codigoPostalLBL.text = "Mi codigo postal es " + (self.datosUsuario.codigoPostalData ?? "")
        self.miCiudadLBL.text = "Mi ciudad es " + (self.datosUsuario.ciudadData ?? "")
        self.posicionGeograficaLBL.text = "Mi posicion geografica es " + (self.datosUsuario.posicionGeograficaData ?? "")
    }
    
    private func configuracionMailCompose() -> MFMailComposeViewController {
        let mailCompo = MFMailComposeViewController()
        mailCompo.mailComposeDelegate = self
        mailCompo.setToRecipients(["info@mail.com", "masinfo@mail.es"])
        mailCompo.setSubject("Este es un mensaje para el equipo de soporte")
        let emailBody = "Los datos del formulario de registro son \(self.miNombreLBL.text ?? "") \n \(self.datosUsuario.apellidoData ?? "")"
        mailCompo.setMessageBody(emailBody, isHTML: false)
        return mailCompo
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

extension CuartaViewController: MFMailComposeViewControllerDelegate {
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
}
