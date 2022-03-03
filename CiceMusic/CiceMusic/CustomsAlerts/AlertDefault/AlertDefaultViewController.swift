//
//  AlertDefaultViewController.swift
//  CiceMusic
//
//  Created by Luis Burgos on 3/3/22.
//

import UIKit

class AlertDefaultViewController: UIViewController {
    
    //BARK: - Variables globales
    var alertManager: CustomAlertManager?
    var type: DefaultAlertType?
    
    //MARK - IBOulets
    @IBOutlet weak var titleAlertLBL: UILabel!
    @IBOutlet weak var messageAlertLBL: UILabel!
    @IBOutlet weak var primaryBTN: UIButton!
    @IBOutlet weak var secondaryBTN: UIButton!
    
    //MARK: - IBActions
    @IBAction func closeACTION(_ sender: UIButton) {
        
    }
    
    @IBAction func primaryACTION(_ sender: UIButton) {
        
    }
    
    @IBAction func secondaryACTION(_ sender: UIButton) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configuracionUI()

        // Do any additional setup after loading the view.
    }
    
    private func configuracionUI() {
        switch alertManager?.type {
        case .successLogin:
            self.titleAlertLBL.text = alertManager?.successLoginTitle
            self.messageAlertLBL.text = alertManager?.successLoginMessage
            self.primaryBTN.setTitle(alertManager?.primaryButton, for: .normal)
            self.secondaryBTN.isHidden = true
        case .failureLogin:
            self.titleAlertLBL.text = alertManager?.failureLoginTitle
            self.messageAlertLBL.text = alertManager?.failureLoginMessage
            self.primaryBTN.setTitle(alertManager?.primaryButton, for: .normal)
            self.secondaryBTN.setTitle(alertManager?.secondButton, for: .normal)
        default:
            self.titleAlertLBL.text = "AQUI LUIS"
            self.messageAlertLBL.text = "Y SI PASA ALGO ??"
            self.primaryBTN.setTitle(alertManager?.primaryButton, for: .normal)
            self.secondaryBTN.setTitle(alertManager?.secondButton, for: .normal)
        }
    }

}
