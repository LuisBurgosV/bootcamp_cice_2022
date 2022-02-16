//
//  NuevaTareaViewController.swift
//  MiTaskVersion3.0
//
//  Created by Luis Burgos on 30/1/22.
//

import UIKit

class NuevaTareaViewController: UIViewController {

    //MARK: - Variables Globales
    let dataSourcePriodidad = ["ALTA","MEDIA-ALTA","MEDIA","MEDIA-BAJA","BAJA"]
    var nombreCategoria = "Sin Categoria"
    var fotoSeleccionada = false
    
    //MARK: - IBOutlets
    @IBOutlet weak var nuevaTareaTF: UITextField!
    @IBOutlet weak var prioridadTF: UITextField!
    @IBOutlet weak var fechaTF: UITextField!
    @IBOutlet weak var categoriaLBL: UILabel!
    @IBOutlet weak var descripcionTF: UITextView!
    @IBOutlet weak var imagenTareaIV: UIImageView!
    @IBOutlet weak var categoriaBTN: UIButton!
    @IBOutlet weak var guardarTareaBTN: UIButton!
    
    //MARK: - IBActions
    @IBAction func muestraListaCategorias(_ sender: Any) {
        let vc = CategoriaCoordinator.view(delegate: self)
        self.show(vc, sender: nil)
    }

    @IBAction func guardarTareaUACTION(_ sender: Any) {
        if validacionDatos() {
            
            if let imageData = self.imagenTareaIV.image?.jpegData(compressionQuality: 0.3) {
                
                SaveFavoritesPresenter.shared.addLocal(favorite: DownloadNewModel(pId: Int.random(in: 0..<999), pNewTask: self.nuevaTareaTF.text ?? "", pPriority: self.prioridadTF.text ?? "", pTaskDate: self.fechaTF.text ?? "", pTaskDescription: self.descripcionTF.text ?? "", pTaskCategory: self.categoriaLBL.text ?? "", pTaskImage: imageData)) { result in
                    if result != nil {
                        self.present(Utils.muestraAlerta(titulo: "Genial!", mensaje: "Los datos se han salvado correctamente en UserDefault", completionHandler: { _ in
                            //notificacion push local (deprecated)
                            let notification = UILocalNotification()
                            notification.fireDate = Date(timeIntervalSinceNow: 5)
                            notification.alertBody = self.nuevaTareaTF.text
                            notification.timeZone = NSTimeZone.default
                            notification.applicationIconBadgeNumber = UIApplication.shared.applicationIconBadgeNumber + 1
                            UIApplication.shared.scheduleLocalNotification(notification)
                            
                            self.limpiarDatos()
                            
                        }), animated: true, completion: nil)
                    }
                } failure: { error in
                    debugPrint(error ?? "Error")
                }
            }
        }else{
            self.present(Utils.muestraAlerta(titulo: "Hey!!", mensaje: "Por favor llena todos los campos y ten en cuenta seleccionar una fotografia de la tarea", completionHandler: nil), animated: true, completion: nil)
        }
    }
    
    private func limpiarDatos() {
        self.nuevaTareaTF.text = ""
        self.prioridadTF.text = ""
        self.fechaTF.text = ""
        self.descripcionTF.text = "Coloca una breve descripcion de la tarea"
        self.imagenTareaIV.image = UIImage(named: "placeholder")
        self.categoriaLBL.text = self.nombreCategoria
    }
    
    @IBAction func muestraCamaraACTION(_ sender: Any) {
        self.muestraSelectorFoto()
    }
    
    @IBAction func muestraDatePickerACTION(_ sender: UITextField) {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .dateAndTime
        sender.inputView = datePicker
        datePicker.addTarget(self, action: #selector(datePickerValueChanged(_:)), for: .valueChanged)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configuracionUI()

        // Do any additional setup after loading the view.
    }
    
    @objc
    private func datePickerValueChanged(_ sender: UIDatePicker){
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
        self.fechaTF.text = dateFormatter.string(from: sender.date)
    }
    
    private func validacionDatos() -> Bool{
        return !(self.nuevaTareaTF.text?.isEmpty ?? false) &&
            !(self.prioridadTF.text?.isEmpty ?? false) &&
            !(self.fechaTF.text?.isEmpty ?? false) &&
            !(self.descripcionTF.text?.isEmpty ?? false) &&
            !(self.categoriaLBL.text?.isEmpty ?? false) &&
            fotoSeleccionada
    }
    
    
    private func muestraSelectorFoto() {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            self.present(Utils.muestraPhotoMenu(completionFoto: { _ in
                self.present(Utils.tomarFoto(delegate: self), animated: true, completion: nil)
            }, completionLibrary: { _ in
                self.present(Utils.muestraPhotoLibrary(delegate: self), animated: true, completion: nil)
            }), animated: true, completion: nil)
        }else{
            self.present(Utils.muestraPhotoLibrary(delegate: self), animated: true, completion: nil)
        }
    }
    
    private func configuracionUI() {
        self.title = "Nueva Tarea"
        self.categoriaBTN.layer.cornerRadius = 16
        self.guardarTareaBTN.layer.cornerRadius = 16
        self.imagenTareaIV.layer.cornerRadius = self.imagenTareaIV.frame.width / 2
        self.imagenTareaIV.layer.borderWidth = 1.2
        self.imagenTareaIV.layer.borderColor = UIColor.red.cgColor
        
        let pickerView = UIPickerView()
        pickerView.delegate = self
        self.prioridadTF.inputView = pickerView
        self.prioridadTF.text = self.dataSourcePriodidad.first
        self.nuevaTareaTF.delegate = self
    }
    
}

extension NuevaTareaViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        DispatchQueue.main.async {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let imageUnw = info[.originalImage] as? UIImage {
            self.imagenTareaIV.image = imageUnw
            self.fotoSeleccionada = true
        }
        
        DispatchQueue.main.async {
            self.dismiss(animated: true, completion: nil)
        }
    }
}

extension NuevaTareaViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.dataSourcePriodidad.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.dataSourcePriodidad[row]
    }
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 60
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        return self.prioridadTF.text = self.dataSourcePriodidad[row]
    }
    
}

extension NuevaTareaViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

extension NuevaTareaViewController: CategoriaViewControllerDelegate {
    func nombreCategoriaSeleccionada(categoria: String) {
        self.categoriaLBL.text = categoria
    }
}
