//
//  Utils.swift
//  CiceTmdbApp
//
//  Created by Luis Burgos on 15/3/22.
//

import Foundation
import UIKit
import MessageUI

enum HTTPMethods: String {
    case get = "GET"
    case post = "POST"
    case delete = "DELETE"
    case put = "PUT"
    case options = "OPTIONS"
}

enum TargetEnvironment: Int {
    case DEV = 0
    case PRE = 1
    case PRO = 3
}

struct RequestDTO {
    var params: [String: AnyObject]?
    var arrayParams: [[String: AnyObject]]?
    var method: HTTPMethods
    var endpoint: String
    var urlContext: URLEnpoint.BaseUrlContext
    
    init(params: [String: AnyObject]?, method: HTTPMethods, endpoint: String, urlContext: URLEnpoint.BaseUrlContext) {
        self.params = params
        self.method = method
        self.endpoint = endpoint
        self.urlContext = urlContext
    }
    
    init(arrayParams: [[String: AnyObject]]?, method: HTTPMethods, endpoint: String, urlContext: URLEnpoint.BaseUrlContext) {
        self.arrayParams = arrayParams
        self.method = method
        self.endpoint = endpoint
        self.urlContext = urlContext
    }
}

struct URLEnpoint {
    
    #if DEV
    static let environmentDefault: TargetEnvironment = TargetEnvironment.DEV
    #elseif PRE
    static let environmentDefault: TargetEnvironment = TargetEnvironment.PRE
    #else
    static let environmentDefault: TargetEnvironment = TargetEnvironment.PRO
    #endif
    
    enum BaseUrlContext{
        case backend
        case webService
        case heroku
    }
    
    //endpoints of movies
    static let endpointMoviesNowPlaying = "movie/now_playing?api_key=\(Obfuscator().reveal(key: Constants.Api.apiKey))"
    static let endpointMoviesPopular = "movie/popular?api_key=\(Obfuscator().reveal(key: Constants.Api.apiKey))"
    static let endpointTopRated = "movie/top_rated?api_key=\(Obfuscator().reveal(key: Constants.Api.apiKey))"
    static let endpointUpcoming = "movie/upcoming?api_key=\(Obfuscator().reveal(key: Constants.Api.apiKey))"
    
}

extension URLEnpoint{
    static func getUrlBase(urlContext: BaseUrlContext) -> String {
        switch urlContext{
        case.backend:
            switch self.environmentDefault{
            case .DEV:
                return ""
            case .PRE:
                return ""
            case .PRO:
                return ""
            }
        case .webService:
            switch self.environmentDefault{
            case .DEV:
                return ""
            case .PRE:
                return ""
            case .PRO:
                return "https://api.themoviedb.org/3/"
            }
        case .heroku:
            switch self.environmentDefault{
            case .DEV:
                return ""
            case .PRE:
                return ""
            case .PRO:
                return ""
            }
        }
    }
}
