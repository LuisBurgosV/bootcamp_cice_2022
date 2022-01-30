//
//  LoginViewController.swift
//  MiTaskVersion3.0
//
//  Created by Luis Burgos on 30/1/22.
//

import UIKit

class LoginViewController: UIViewController {

    //MARK: - Variables globales
    var usuarioLogado = false
    
    //MARK: - IBOutlets
    @IBOutlet weak var contentViewUsername: UIView!
    @IBOutlet weak var contentViewPassword: UIView!
    @IBOutlet weak var loginBtn: UIButton!
    
    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    //MARK: - IBActions
    @IBAction func rememberMeAction(_ sender: Any) {
        if datosCompletados() {
            self.usuarioLogado = true
            Utils.Constantes().kPrefs.setValue(self.usernameTF.text, forKey: Utils.Constantes().kUsername)
            Utils.Constantes().kPrefs.setValue(self.passwordTF.text, forKey: Utils.Constantes().kPassword)
            Utils.Constantes().kPrefs.setValue(self.usuarioLogado, forKey: Utils.Constantes().kUsuarioLogado)
            self.configuracionUI(color: #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1))
        }else{
            self.present(Utils.muestraAlerta(titulo: "Hey!", mensaje: "Rellena el username y password", completionHandler: nil), animated: true, completion: nil)
        }
    }
    
    @IBAction func loginAction(_ sender: Any) {
        if datosCompletados() {
            self.borrarDatosFormulario()
        }else{
            self.present(Utils.muestraAlerta(titulo: "Hey!", mensaje: "Rellena el username y password", completionHandler: nil), animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configuracionUI(color: #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1))

        // Do any additional setup after loading the view.
    }
    
    //MARK: - Metodos privados
    private func configuracionUI(color: UIColor) {
        self.contentViewUsername.backgroundColor = .clear
        self.contentViewUsername.layer.cornerRadius = 37
        self.contentViewUsername.layer.borderWidth = 2
        self.contentViewUsername.layer.borderColor = color.cgColor
        
        self.contentViewPassword.backgroundColor = .clear
        self.contentViewPassword.layer.cornerRadius = 37
        self.contentViewPassword.layer.borderWidth = 2
        self.contentViewPassword.layer.borderColor = color.cgColor
        
        self.loginBtn.layer.cornerRadius = 23
    }
    
    private func datosCompletados() -> Bool {
        return !(self.usernameTF.text?.isEmpty ?? false) && !(self.passwordTF.text?.isEmpty ?? false)
    }
    
    private func borrarDatosFormulario() {
        self.usernameTF.text = ""
        self.passwordTF.text = ""
        self.mostrarHomeTabBar()
    }
    
    private func mostrarHomeTabBar() {
        let vc = HomeTabBarViewCoordinator.homeViewController()
        vc.modalTransitionStyle = .coverVertical
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
}
