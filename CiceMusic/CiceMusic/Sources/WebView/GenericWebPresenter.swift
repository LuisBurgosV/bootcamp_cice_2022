//
//  GenericWebPresenter.swift
//  CiceMusic
//
//  Created by Luis Burgos on 5/3/22.
//

import Foundation

protocol GenericWebPresenterInputProtocol {
    
}

final class GenericWebPresenter {
    var viewController: GenericWebOutputPresenterProtocol?
}

extension GenericWebPresenter: GenericWebPresenterInputProtocol {
    
}
