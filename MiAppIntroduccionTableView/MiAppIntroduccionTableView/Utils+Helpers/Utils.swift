//
//  Utils.swift
//  MiAppIntroduccionTableView
//
//  Created by Luis Burgos on 25/1/22.
//

import UIKit

protocol ReuseIdentifierView: AnyObject {
    static var defaultReuseIdentifier: String { get }
}

extension ReuseIdentifierView where Self: UIView {
    static var defaultReuseIdentifier: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
}

class Utils {
    struct Constants {
        let tituloListaMeses = "Meses"
        let tituloListaCoches = "Coches"
    }
}
