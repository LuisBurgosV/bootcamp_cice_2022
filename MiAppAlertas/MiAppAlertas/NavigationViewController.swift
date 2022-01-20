//
//  NavigationViewController.swift
//  MiAppAlertas
//
//  Created by Luis Burgos on 20/1/22.
//

import UIKit

class NavigationViewController: UIViewController {
    
    // MARK: - Variables
    
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var tituloQuesoLBL: UILabel!
    
    @IBOutlet weak var detalleTextQuesoTXV: UITextView!
    
    @IBOutlet weak var imagenQuesoImV: UIImageView!
    
    @IBOutlet weak var pickerQuesoPicV: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.configuracionUI()
    }
    
    // MARK: - Metodos privados
    private func configuracionUI(){
        
    }

}
