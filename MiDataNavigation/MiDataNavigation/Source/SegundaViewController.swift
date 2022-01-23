//
//  SegundaViewController.swift
//  MiDataNavigation
//
//  Created by Luis Burgos on 22/1/22.
//

import UIKit

class SegundaViewController: UIViewController {

    //MARK: - Variables
    var datosUsuario = DatosUsuarioModel()
    var edadPerro: Int?
    var nuevaEdadPerro: Int?
    
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var miNombreLBL: UILabel!
    @IBOutlet weak var miApellidoLBL: UILabel!
    
    @IBOutlet weak var miTelefonoTF: UITextField!
    @IBOutlet weak var miDireccionTF: UITextField!
    @IBOutlet weak var calcularEdadPerroTF: UITextField!
    
    //MARK: - IBACtions
    
    @IBAction func calculoEdadPerroACTION(_ sender: UIButton) {
        self.edadPerro = Int(self.calcularEdadPerroTF.text ?? "0")
        
        if let edadPerroUnw = self.edadPerro {
            self.nuevaEdadPerro = edadPerroUnw * 7
            self.present(Utils.shared.showAlertVC(title: "Edad de mi perro", message: "El calculo de la edad de mi perro es: \(self.nuevaEdadPerro ?? 0)"), animated: true, completion: nil)
            self.calcularEdadPerroTF.text = String(nuevaEdadPerro ?? 0)
        }else{
            self.present(Utils.shared.showAlertVC(title: "Estimado usuario", message: "Por favor introduce la edad de tu perro para calcularla"), animated: true, completion: nil)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        debugPrint(self.datosUsuario.nombreData ?? "")
        debugPrint(self.datosUsuario.apellidoData ?? "")
        configuracionUI()
        // Do any additional setup after loading the view.
    }
    
    private func configuracionUI() {
        self.miNombreLBL.text = "Mi nombre es " + (self.datosUsuario.nombreData ?? "")
        self.miApellidoLBL.text = "Mi apellido es " + (self.datosUsuario.apellidoData ?? "")
    }
    
    //MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueV3" {
            
            if !(self.miTelefonoTF.text?.isEmpty ?? false) && !(self.miDireccionTF.text?.isEmpty ?? false) && (self.calcularEdadPerroTF.text == String(self.nuevaEdadPerro ?? 0)) {
                
                let ventana3VC = segue.destination as! TerceraViewController
                ventana3VC.datosUsuario.nombreData = self.datosUsuario.nombreData
                ventana3VC.datosUsuario.apellidoData = self.datosUsuario.apellidoData
                ventana3VC.datosUsuario.telefonoData = self.miTelefonoTF.text
                ventana3VC.datosUsuario.direccionData = self.miDireccionTF.text
                ventana3VC.datosUsuario.edadPerroData = self.calcularEdadPerroTF.text
                
            }else{
                self.present(Utils.shared.showAlertVC(title: "Estimado usuario", message: "Debes de rellenar los campos para continuar"), animated: true, completion: nil)
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

}
