//
//  ViewController.swift
//  ObfuscatorTools
//
//  Created by Luis Burgos on 15/3/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print(Obfuscator().bytesByObfuscatingString(string: "ba24ed2e73a4c8ef633f3cbb20513ba1"))
        // Do any additional setup after loading the view.
    }


}

