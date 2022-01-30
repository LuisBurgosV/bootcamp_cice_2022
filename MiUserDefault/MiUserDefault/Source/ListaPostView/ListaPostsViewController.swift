//
//  ListaPostsViewController.swift
//  MiUserDefault
//
//  Created by Luis Burgos on 30/1/22.
//

import UIKit

class ListaPostsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configuracionLogout()

        // Do any additional setup after loading the view.
    }
    
    private func configuracionLogout() {
        let BarButton = UIBarButtonItem(image: UIImage(systemName: "close"), style: .plain, target: self, action: #selector(logout))
        self.navigationItem.rightBarButtonItem = BarButton
        
    }
    
    @objc
    func logout() {
        Utils.Constants().kPrefs.setValue(false, forKey: Utils.Constants().kUserLogado)
        
        let vc = RegistroCoordinator.view()
        vc?.modalTransitionStyle = .coverVertical
        vc?.modalPresentationStyle = .fullScreen
        self.present(vc ?? UIViewController(), animated: true, completion: nil)
    }
}
