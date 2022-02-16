//
//  SplashViewController.swift
//  CiceMusic
//
//  Created by Luis Burgos on 16/2/22.
//

import UIKit

//Output del presenter
protocol SplashPresenterOutputProtocol {
    
}

class SplashViewController: BaseView<SplashPresenterInputProtocol> {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.fettchDataFromWebService()

        // Do any additional setup after loading the view.
    }
}

//Output del presenter
extension SplashViewController: SplashPresenterOutputProtocol {
    
}
