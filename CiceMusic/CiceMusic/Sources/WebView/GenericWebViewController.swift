//
//  GenericWebViewController.swift
//  CiceMusic
//
//  Created by Luis Burgos on 5/3/22.
//

import UIKit
protocol GenericWebOutputPresenterProtocol {
    
}

class GenericWebViewController: UIViewController {
    
    var presenter: GenericWebPresenterInputProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}

extension GenericWebViewController: GenericWebOutputPresenterProtocol  {
    
}
