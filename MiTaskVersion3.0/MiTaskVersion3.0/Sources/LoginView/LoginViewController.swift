//
//  LoginViewController.swift
//  MiTaskVersion3.0
//
//  Created by Luis Burgos on 30/1/22.
//

import UIKit

class LoginViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var contentViewUsername: UIView!
    @IBOutlet weak var contentViewPassword: UIView!
    @IBOutlet weak var loginBtn: UIButton!
    
    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    //MARK: - IBActions
    @IBAction func rememberMeAction(_ sender: Any) {
    }
    
    @IBAction func loginAction(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configuracionUI()

        // Do any additional setup after loading the view.
    }
    
    //MARK: - Metodos privados
    private func configuracionUI() {
        self.contentViewUsername.backgroundColor = .clear
        self.contentViewUsername.layer.cornerRadius = 37
        self.contentViewUsername.layer.borderWidth = 2
        self.contentViewUsername.layer.borderColor = #colorLiteral(red: 1, green: 0.2827598444, blue: 0.25824927, alpha: 1)
        
        self.contentViewPassword.backgroundColor = .clear
        self.contentViewPassword.layer.cornerRadius = 37
        self.contentViewPassword.layer.borderWidth = 2
        self.contentViewPassword.layer.borderColor = #colorLiteral(red: 1, green: 0.2827598444, blue: 0.25824927, alpha: 1)
        
        self.loginBtn.layer.cornerRadius = 22
    }


}
