//
//  ViewController.swift
//  MyFirstApp
//
//  Created by Luis Burgos on 16/1/22.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Variables
    
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var miHolaMundo: UILabel!
    @IBOutlet weak var miSaludoMasLargo: UILabel!
    @IBOutlet weak var miBotonSaludaATodos: UIButton!
    
    //MARK: - IBActions
    @IBAction func miBotonSaludaATodosAction(_ sender: UIButton) {
        self.miHolaMundo.text = "Hola al Bootcamp de iOS CICE 2022"
        self.miSaludoMasLargo.text = "Adios a todos y nos vemos despues del descanso"
        self.miBotonSaludaATodos.setTitle("Aqui de nuevo", for: .normal)
        self.miBotonSaludaATodos.layer.cornerRadius = 10
    } 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.estamosCurrando()
        
        
    }
    
    //MARK: - Funciones privadas
    private func estamosCurrando(){
        print("Aqui estmos currando a tope")
    }


}

