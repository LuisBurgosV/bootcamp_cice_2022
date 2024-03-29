//
//  Utils.swift
//  CiceMusic
//
//  Created by Luis Burgos on 17/2/22.
//

import UIKit

enum HTTPMethods: String {
    case get = "GET"
    case post = "POST"
    case delete = "DELETE"
    case put = "PUT"
    case options = "OPTIONS"
}

struct RequestDTO {
    var params: [String: AnyObject]?
    var arrayParams: [[String: AnyObject]]?
    var method: HTTPMethods
    var endpoint: String
    
    init(params: [String: AnyObject]?, method: HTTPMethods, endpoint: String) {
        self.params = params
        self.method = method
        self.endpoint = endpoint
    }
    
    init(arrayParams: [[String: AnyObject]]?, method: HTTPMethods, endpoint: String) {
        self.arrayParams = arrayParams
        self.method = method
        self.endpoint = endpoint
    }
}

struct URLEnpoint {
    static let baseUrl = "https://rss.applemarketingtools.com/api/v2/%@/"
    static let music = "music/most-played/%@/songs.json"
    static let podcast = "podcasts/top/%@/podcast-episodes.json"
    static let books = "books/top-free/%@/books.json"
    static let apps = "apps/top-free/%@/apps.json"
}

class Utils {
    
    struct Constantes {
        let kUsername = "USERNAME"
        let kPassword = "PASSWORD"
        let kUsuarioLogado = "USUARIO_LOGADO"
        let kPrefer = UserDefaults.standard
    }
    
    static func showAlert(title: String, message: String) -> UIAlertController {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        return alertVC
    }
}

protocol ReuseIdentifierProtocol: AnyObject {
    static var defaultReuseIdentifier: String { get }
    
}

extension ReuseIdentifierProtocol where Self: UIView {
    static var defaultReuseIdentifier: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
}
