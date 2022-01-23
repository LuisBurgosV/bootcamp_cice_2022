//
//  TerceraViewController.swift
//  MiDataNavigation
//
//  Created by Luis Burgos on 22/1/22.
//

import UIKit

class TerceraViewController: UIViewController {

    //MARK: - Variables
    var datosUsuario = DatosUsuarioModel()
    let codigosPostales = ["11001", "22002", "33003", "44004", "55005"]
    
    //MARK: - IBOutlets
    @IBOutlet weak var miNombreLBL: UILabel!
    @IBOutlet weak var miApellidoLBL: UILabel!
    @IBOutlet weak var miTelefonoLBL: UILabel!
    @IBOutlet weak var miDireccionLBL: UILabel!
    @IBOutlet weak var edadPerroLBL: UILabel!
    
    @IBOutlet weak var codigoPostalTF: UITextField!
    @IBOutlet weak var ciudadTF: UITextField!
    @IBOutlet weak var posicionGeograficaTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configuracionUI()
        self.configuracionPickerView()
        // Do any additional setup after loading the view.
    }
    
    //MARK: - funciones privadas
    private func configuracionUI() {
        self.miNombreLBL.text = "Mi nombre es " + (self.datosUsuario.nombreData ?? "")
        self.miApellidoLBL.text = "Mi apellido es " + (self.datosUsuario.apellidoData ?? "")
        self.miTelefonoLBL.text = "Mi telefono es " + (self.datosUsuario.telefonoData ?? "")
        self.miDireccionLBL.text = "Mi direccion es " + (self.datosUsuario.direccionData ?? "")
        self.edadPerroLBL.text = "La edad de mi perro es " + (self.datosUsuario.edadPerroData ?? "")
    }
    
    private func configuracionPickerView() {
        Utils.shared.configuracionPickerView(tag: 1, delegate: self, dataSource: self, textField: self.codigoPostalTF, dataArray: codigosPostales)
    }
    

    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueV4" {
            
            if !(self.codigoPostalTF.text?.isEmpty ?? false) && !(self.ciudadTF.text?.isEmpty ?? false) && !(self.posicionGeograficaTF.text?.isEmpty ?? false){
                
                let ventana4VC = segue.destination as! CuartaViewController
                ventana4VC.datosUsuario.nombreData = self.datosUsuario.nombreData
                ventana4VC.datosUsuario.apellidoData = self.datosUsuario.apellidoData
                ventana4VC.datosUsuario.telefonoData = self.datosUsuario.telefonoData
                ventana4VC.datosUsuario.direccionData = self.datosUsuario.direccionData
                ventana4VC.datosUsuario.edadPerroData = self.datosUsuario.edadPerroData
                ventana4VC.datosUsuario.codigoPostalData = self.codigoPostalTF.text
                ventana4VC.datosUsuario.ciudadData = self.ciudadTF.text
                ventana4VC.datosUsuario.posicionGeograficaData = self.posicionGeograficaTF.text
                
            }else{
                self.present(Utils.shared.showAlertVC(title: "Estimado usuario", message: "Debes de rellenar los campos para continuar"), animated: true, completion: nil)
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

}

//MARK: - PickerViewThings
extension TerceraViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //hacer un switch por cada tag que quieras que salga pickerView
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 1 {
            return self.codigosPostales.count
        }
        return 0
    }
}

extension TerceraViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 1 {
            return self.codigosPostales[row]
        }
        return ""
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 50
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 1 {
            self.codigoPostalTF.text = self.codigosPostales[row]
        }
    }
}
